require 'json'

Facter.add(:yggdrasil) do
  confine { Facter.value(:kernel) != 'windows' }

  setcode do
    message = {}
    if Facter::Util::Resolution.which('yggdrasilctl')
      output = Facter::Util::Resolution.exec('yggdrasilctl -json getself')
      # output is { "self" :{ "<ip>": { info ...
      # splice it a bit to be more facter-y
      begin
        json = JSON.parse(output)
        myself = json['self']
        myip = myself.keys[0]
        myself[myip]['ip'] = myip
        message = myself[myip]
      rescue
      end
    end # which

    interfaces = Facter.value(:networking)['interfaces']
    interfaces.each do |_interface, info|
      bindings = info['bindings6']

      next unless bindings
      bindings.each do |binding|
        firstbits = binding['network'].split(':')[0].to_i(16)

        if (firstbits >= 0x0200) && (firstbits < 0x0300)
          # do we need an additional fact here?
          message['derived_ip'] = binding['address']
        end
        if (firstbits >= 0x0300) && (firstbits < 0x0400)
          message['routed_ip'] = binding['address']
        end
      end # each binding
    end # interfaces.each

    message
  end # setcode do
end # Facter.add

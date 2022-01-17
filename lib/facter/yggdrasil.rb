require 'json'

Facter.add(:yggdrasil) do
  confine { Facter.value(:kernel) != 'windows' }

  setcode do
    if Facter::Util::Resolution.which('yggdrasilctl')
      output = Facter::Util::Resolution.exec('yggdrasilctl -json getself')
      # output is { "self" :{ "<ip>": { info ...
      # splice it a bit to be more facter-y
      begin
        json = JSON.parse(output)
        myself = json['self']
        myip = myself.keys[0]
        myself[myip]['ip'] = myip
        myself[myip]
      rescue
        {}
      end
    end
  end
end

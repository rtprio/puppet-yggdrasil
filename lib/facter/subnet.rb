require 'json'

Facter.add(:test) do
  confine { Facter.value(:kernel) != 'windows' }
  setcode do
    interfaces = Facter.value(:networking)['interfaces']
    message = Hash.new()
    message['present'] = "yes"
    interfaces.each do |interface, info|
      bindings = info['bindings6']
      bindings.each do |binding|
        if binding['network'] == '200::' 
          message['yggdrasil'] = binding['network']
        end

        if binding['network'] == '300::'
          message['yggdrasilrouted'] = binding['network']
        end
      end
    end
    message
  end
end

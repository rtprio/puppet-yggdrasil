require 'json'

Facter.add(:yggdrasil) do
  confine { Facter.value(:kernel) != 'windows' }

  setcode do
    if Facter::Util::Resolution.which('yggdrasilctl')
      output = Facter::Util::Resolution.exec('yggdrasilctl -json getself')

      JSON.parse(output)
    end
  end
end

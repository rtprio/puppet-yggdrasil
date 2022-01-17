require 'spec_helper'

describe 'yggdrasil' do
  let(:facts) { { "os" => {
    "distro" => { "codename" => "buster", "id" => "Debian",
    "release" => { "full" => "10.11", "major" => "10", "minor" => "11", } },
    "family" => "Debian", "name" => "Debian",
    "release" => { "full" => "10.11", "major" => "10", "minor" => "11", },
  } } }
    
  it { is_expected.to compile }
  it { is_expected.to contain_class('yggdrasil::install') }
  it { is_expected.to contain_class('yggdrasil::keys') }
  it { is_expected.to contain_class('yggdrasil::config') }
  it { is_expected.to contain_class('yggdrasil::service') }

  let(:facts) { {
  "os": {
    "distro": {
      "codename": "Ootpa",
      "id": "RedHatEnterprise",
      "release": { "full": "8.5", "major": "8", "minor": "5" } },
    "family": "RedHat", "hardware": "x86_64", "name": "OracleLinux",
    "release": { "full": "8.5", "major": "8", "minor": "5" },
  }
} }

  
  it { is_expected.to compile }
  it { is_expected.to contain_class('yggdrasil::install') }
  it { is_expected.to contain_class('yggdrasil::keys') }
  it { is_expected.to contain_class('yggdrasil::config') }
  it { is_expected.to contain_class('yggdrasil::service') }

end

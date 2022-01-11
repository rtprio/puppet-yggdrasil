require 'spec_helper'

describe 'yggdrasil::install' do
  it { is_expected.to compile }
  it { is_expected.to contain_package('yggdrasil') }
  it { is_expected.to contain_package('yggdrasil').only_with_ensure('installed') }
end

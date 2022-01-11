require 'spec_helper'

describe 'yggdrasil::install' do
  it { is_expected.to compile }
  it { is_expected.to contain_package('yggdrasil') }
end

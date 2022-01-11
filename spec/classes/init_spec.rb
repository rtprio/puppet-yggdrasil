require 'spec_helper'

describe 'yggdrasil' do
  it { is_expected.to compile }
  it { is_expected.to contain_class('yggdrasil::install') }
  it { is_expected.to contain_class('yggdrasil::config') }
  it { is_expected.to contain_class('yggdrasil::service') }
  
end

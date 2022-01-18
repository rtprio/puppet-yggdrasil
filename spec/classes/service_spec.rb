require 'spec_helper'

describe 'yggdrasil::service' do
  it { is_expected.to compile }
  it { is_expected.to contain_service('yggdrasil').with_ensure('running') }
end

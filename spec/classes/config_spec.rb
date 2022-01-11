require 'spec_helper'

describe 'yggdrasil::config' do
  let(:facts) { { 'puppet_vardir' => '/tmp' } }

  it { is_expected.to compile }
end

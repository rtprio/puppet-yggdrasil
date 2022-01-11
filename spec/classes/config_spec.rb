require 'spec_helper'

describe 'yggdrasil::config' do
  it { is_expected.to compile }

  context 'with keys as parameters' do
    let(:params) { { 'public_key' => '0xdeadbeef' } }

    it { is_expected.to compile }
  end
end

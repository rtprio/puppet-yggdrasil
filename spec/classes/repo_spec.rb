require 'spec_helper'

describe 'yggdrasil::repo' do
  describe 'default' do
    it { is_expected.to compile }
  end

  describe 'redhat' do
    let(:facts) { { 'os' => { 'family' => 'RedHat', 'release' => { 'major' => '7', 'minor' => '1', 'full' => '7.1.1503' } }, 'kernel' => 'Linux' } }

    it { is_expected.to compile.and_raise_error(%r{no repo exists}) }
  end
end

require 'spec_helper'

describe 'yggdrasil::config' do
  it { is_expected.to compile }
  it { is_expected.to contain_file("/etc/yggdrasil.conf") }
end

require 'chefspec'

describe 'gusztavvargadr_windows_test::node' do
  platform 'windows'

  it { is_expected.to write_log('hello') }
end

require 'chefspec'

describe 'gusztavvargadr_windows_test::files' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::files') }
end

require 'chefspec'

describe 'gusztavvargadr_windows_test::updates' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::updates') }
end

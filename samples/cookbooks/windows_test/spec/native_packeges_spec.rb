require 'chefspec'

describe 'gusztavvargadr_windows_test::native_packages' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::native_packages') }
end

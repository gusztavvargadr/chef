require 'chefspec'

describe 'gusztavvargadr_windows_test::chocolatey_packages' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::chocolatey_packages') }
end

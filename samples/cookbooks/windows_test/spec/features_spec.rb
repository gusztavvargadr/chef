require 'chefspec'

describe 'gusztavvargadr_windows_test::features' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::features') }
end

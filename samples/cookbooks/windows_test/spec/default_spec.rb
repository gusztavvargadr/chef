require 'chefspec'

describe 'gusztavvargadr_windows_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::default') }
end

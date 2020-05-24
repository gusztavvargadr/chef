require 'chefspec'

describe 'gusztavvargadr_windows_test::environment_variables' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_windows::environment_variables') }
end

require 'chefspec'

describe 'gusztavvargadr_visualstudio_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_visualstudio::default') }
end

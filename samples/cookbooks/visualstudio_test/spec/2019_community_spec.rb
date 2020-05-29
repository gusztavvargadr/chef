require 'chefspec'

describe 'gusztavvargadr_visualstudio_test::2019_community' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_visualstudio::2019_community') }
end

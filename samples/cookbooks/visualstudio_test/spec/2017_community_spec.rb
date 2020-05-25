require 'chefspec'

describe 'gusztavvargadr_visualstudio_test::2017_community' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_visualstudio::2017_community') }
end

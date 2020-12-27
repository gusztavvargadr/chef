require 'chefspec'

describe 'gusztavvargadr_iis_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_iis::default') }
end

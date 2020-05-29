require 'chefspec'

describe 'gusztavvargadr_iis_test::server' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_iis::server') }
end

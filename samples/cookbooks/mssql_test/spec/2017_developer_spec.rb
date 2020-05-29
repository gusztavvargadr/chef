require 'chefspec'

describe 'gusztavvargadr_mssql_test::2019_developer' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_mssql::2019_developer') }
end

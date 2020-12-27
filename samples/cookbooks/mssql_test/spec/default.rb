require 'chefspec'

describe 'gusztavvargadr_mssql_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_mssql::default') }
end

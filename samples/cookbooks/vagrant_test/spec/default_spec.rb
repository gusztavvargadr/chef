require 'chefspec'

describe 'gusztavvargadr_vagrant_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_vagrant::default') }
end

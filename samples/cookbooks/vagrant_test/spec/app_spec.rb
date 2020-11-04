require 'chefspec'

describe 'gusztavvargadr_vagrant_test::app' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_vagrant::app') }
end

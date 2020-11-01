require 'chefspec'

describe 'gusztavvargadr_vagrant::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_vagrant::app') }
end

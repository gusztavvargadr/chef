require 'chefspec'

describe 'gusztavvargadr_vagrant_test::cli' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_vagrant::cli') }
end

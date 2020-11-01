require 'chefspec'

describe 'gusztavvargadr_docker_test::default' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_docker::default') }
end

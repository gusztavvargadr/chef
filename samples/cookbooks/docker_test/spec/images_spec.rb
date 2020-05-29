require 'chefspec'

describe 'gusztavvargadr_docker_test::images' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_docker::images') }
end

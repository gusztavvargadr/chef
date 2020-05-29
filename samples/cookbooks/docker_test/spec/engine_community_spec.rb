require 'chefspec'

describe 'gusztavvargadr_docker_test::engine_community' do
  platform 'windows'

  it { is_expected.to include_recipe('gusztavvargadr_docker::engine_community') }
end

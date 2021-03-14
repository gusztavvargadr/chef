require 'chefspec'

describe 'gusztavvargadr_docker_test::default' do
  platform 'windows'

  it {
    allow_any_instance_of(Chef::Resource).to receive(:reboot_pending?).and_return(true)

    is_expected.to include_recipe('gusztavvargadr_docker::default')
  }
end
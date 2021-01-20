choco install git --package-parameters '"/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /SChannel"' --confirm --no-progress
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version 20.12.187

# cd lib/test-kitchen/kitchen-docker
# chef gem build --force kitchen-docker.gemspec
# chef gem install --force --local kitchen-docker-2.10.0.gem

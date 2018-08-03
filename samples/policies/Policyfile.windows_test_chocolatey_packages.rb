name 'windows_test_chocolatey_packages'

run_list 'recipe[gusztavvargadr_windows_test::chocolatey_packages]'

default_source :supermarket
default_source :chef_repo, '../cookbooks'

cookbook 'gusztavvargadr_windows_test'
cookbook 'gusztavvargadr_windows'

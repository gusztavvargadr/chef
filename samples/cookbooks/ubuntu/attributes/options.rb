default['gusztavvargadr_ubuntu']['options']['tools']['desktop:ubuntu'] = {
  'packages' => %w(ubuntu-desktop xrdp),
}

default['gusztavvargadr_ubuntu']['options']['tools']['desktop:xubuntu'] = {
  'packages' => %w(xubuntu-desktop firefox xrdp),
}

default['gusztavvargadr_ubuntu']['options']['tools']['desktop'] = default['gusztavvargadr_ubuntu']['options']['tools']['desktop:ubuntu']

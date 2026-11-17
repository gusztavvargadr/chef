default['gusztavvargadr_hello_world']['options']['files']['hello-world'] = {
  'windows' => {
    'path' => 'C:\Windows\Temp\hello-world.txt',
    'content' => 'Hello, World!',
  },
  'ubuntu' => {
    'path' => '/var/tmp/hello-world.txt',
    'content' => 'Hello, World!',
  },
}

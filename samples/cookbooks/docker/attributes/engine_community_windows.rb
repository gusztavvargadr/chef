default['gusztavvargadr_docker']['engine']['community']['windows'] = {
  'features' => {
    'Containers$' => {},
    'Microsoft-Hyper-V$' => {},
  },
  'powershell_source' => 'https://raw.githubusercontent.com/microsoft/Windows-Containers/c344adb529e8fed66e9d16aceb17943b50578b1e/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
  'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
}

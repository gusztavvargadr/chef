default['gusztavvargadr_mssql']['2017_ssms'] = {
  'native_packages' => {
    'SSMS 17.9' => {
      'source' => 'https://download.microsoft.com/download/B/8/3/B839AD7D-DDC7-4212-9643-28E148251DC1/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn/ManagementStudio/Ssms.exe',
      'elevated' => true,
    },
  },
}

default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.5.1' => {
      'source' => 'https://download.microsoft.com/download/d/1/c/d1c74788-0c6b-4d23-896e-67cf849d31ed/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
      'elevated' => true,
    },
  },
}

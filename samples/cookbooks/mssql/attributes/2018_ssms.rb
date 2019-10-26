default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.3.1' => {
      'source' => 'https://download.microsoft.com/download/1/9/8/1986c4a9-480b-4a46-8088-2778e0abcc8a/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server/150/Tools/Binn/ManagementStudio/Ssms.exe',
      'elevated' => true,
    },
  },
}

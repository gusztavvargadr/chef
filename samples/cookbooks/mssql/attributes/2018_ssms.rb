default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.2' => {
      'source' => 'https://download.microsoft.com/download/2/9/C/29CC9731-CE3B-4EC8-89D8-E6B8EE88EAF5/SSMS-Setup-ENU.exe',
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

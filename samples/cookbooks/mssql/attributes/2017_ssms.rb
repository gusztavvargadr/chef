default['gusztavvargadr_mssql']['2017_ssms'] = {
  'native_packages' => {
    'SSMS 17.7' => {
      'source' => 'https://download.microsoft.com/download/0/D/2/0D26856F-E602-4FB6-8F12-43D2559BDFE4/SSMS-Setup-ENU.exe',
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

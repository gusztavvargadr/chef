default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer'] = {
  'windows' => {
    'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
    'configuration_file_name' => 'server_2019_developer.ini',
    'patch_file_url' => 'https://catalog.s.download.windowsupdate.com/c/msdownload/update/software/updt/2023/10/sqlserver2019-kb5030333-x64_8a1e1b207018159cecbf5e8f92c1a4cae3112202.exe',
  },
}

default['gusztavvargadr_mssql']['options']['tools']['server:2019'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer']
default['gusztavvargadr_mssql']['options']['tools']['server:latest'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019']
default['gusztavvargadr_mssql']['options']['tools']['server'] = default['gusztavvargadr_mssql']['options']['tools']['server:latest']

default['gusztavvargadr_mssql']['options']['tools']['management-studio:19'] = {
  'windows' => {
    'native_packages' => {
      'SSMS 19.2' => {
        'source' => 'https://download.microsoft.com/download/6/2/6/626e40a7-449e-418d-9726-33b523a1e336/SSMS-Setup-ENU.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
        'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe',
      },
    },
  },
}

default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:19']
default['gusztavvargadr_mssql']['options']['tools']['management-studio'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest']

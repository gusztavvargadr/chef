default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer'] = {
  'windows' => {
    'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
    'configuration_file_name' => 'server_2019_developer.ini',
    'patch_file_url' => 'https://catalog.s.download.windowsupdate.com/c/msdownload/update/software/updt/2023/08/sqlserver2019-kb5027702-x64_068e588c1dddb42f5cdb334c55c64d42f5eec95e.exe',
  },
}

default['gusztavvargadr_mssql']['options']['tools']['server:2019'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer']
default['gusztavvargadr_mssql']['options']['tools']['server:latest'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019']
default['gusztavvargadr_mssql']['options']['tools']['server'] = default['gusztavvargadr_mssql']['options']['tools']['server:latest']

default['gusztavvargadr_mssql']['options']['tools']['management-studio:2019'] = {
  'windows' => {
    'native_packages' => {
      'SSMS 19.1' => {
        'source' => 'https://download.microsoft.com/download/a/c/a/aca4e29f-6925-4d50-a06b-5576c6ea629f/SSMS-Setup-ENU.exe',
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

default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:2019']
default['gusztavvargadr_mssql']['options']['tools']['management-studio'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest']

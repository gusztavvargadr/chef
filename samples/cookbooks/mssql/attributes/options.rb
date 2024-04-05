default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer'] = {
  'windows' => {
    'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
    'configuration_file_name' => 'server_2019_developer.ini',
    'patch_file_url' => 'https://catalog.s.download.windowsupdate.com/d/msdownload/update/software/updt/2024/02/sqlserver2019-kb5033688-x64_a781728ac862e8cd97c508314f3ea4886b70bd84.exe',
  },
}

default['gusztavvargadr_mssql']['options']['tools']['server:2019'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer']
default['gusztavvargadr_mssql']['options']['tools']['server:latest'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019']
default['gusztavvargadr_mssql']['options']['tools']['server'] = default['gusztavvargadr_mssql']['options']['tools']['server:latest']

default['gusztavvargadr_mssql']['options']['tools']['management-studio:19'] = {
  'windows' => {
    'native_packages' => {
      'SSMS 19.3' => {
        'source' => 'https://download.microsoft.com/download/1/b/c/1bc1f462-ac3a-402d-b872-c4cae745c539/SSMS-Setup-ENU.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
        'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 20/Common7/IDE/Ssms.exe',
      },
    },
  },
}

default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:19']
default['gusztavvargadr_mssql']['options']['tools']['management-studio'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest']

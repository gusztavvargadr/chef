describe file('C:/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn/ManagementStudio/Ssms.exe') do
  its('product_version') { should include '14.0.17289.0' }
end

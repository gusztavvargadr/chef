describe file('C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe') do
  its('product_version') { should include '15.0.18390.0' }
end

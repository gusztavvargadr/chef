describe file('C:/Program Files (x86)/Microsoft SQL Server Management Studio 20/Common7/IDE/Ssms.exe') do
  it { should exist }
end

describe file('C:/Program Files (x86)/Microsoft SQL Server Management Studio 20/Common7/IDE/Ssms.exe') do
  its('product_version') { should include '20.0.' }
end

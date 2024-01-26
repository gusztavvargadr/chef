describe file('C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe') do
  it { should exist }
end

describe file('C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe') do
  its('product_version') { should include '19.3.' }
end

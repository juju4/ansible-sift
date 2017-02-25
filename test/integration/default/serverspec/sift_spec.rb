require 'serverspec'

# Required by serverspec
set :backend, :exec

describe port(22) do
  it { should be_listening }
end

describe package('netcat') do
  it { should be_installed }
end
describe package('scalpel') do
  it { should be_installed }
end
describe package('elasticsearch') do
  it { should be_installed }
end

describe file('/home/sansforensics/Desktop/sift-cheatsheet.pdf') do
  it { should be_symlink }
end
describe file('/home/sansforensics/Desktop/SANS-DFIR.pdf') do
  it { should be_symlink }
end
describe file('/usr/share/tsk/sorter/archives.sort') do
  it { should be_file }
end
describe file('/usr/local/bin/update-sift') do
  it { should be_file }
  it { should be_executable }
end
describe file('/usr/bin/java') do
  it { should be_file }
  it { should be_executable }
end
describe file('/usr/bin/bulk_extractor'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  it { should be_file }
  it { should be_executable }
end
describe file('/usr/local/bin/bulk_extractor'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  it { should be_file }
  it { should be_executable }
end
describe file('/usr/lib/python2.7/dist-packages/volatility/plugins/autoruns.py'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  it { should be_file }
end
describe file('/usr/local/lib/python2.7/dist-packages/volatility/plugins/autoruns.py'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  it { should be_file }
end
describe file('/usr/share/sift/images/dfir_logo.png') do
  it { should be_file }
end
describe file('/usr/share/regripper/rip.pl') do
  it { should be_file }
  it { should be_executable }
end

describe file('/etc/hosts') do
  its(:content) { should match /siftworkstation/ }
end


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


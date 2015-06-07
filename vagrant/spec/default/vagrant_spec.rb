require 'spec_helper'


describe 'Timezone' do
  describe command('date') do
    its(:stdout) { should contain 'JST' }
  end
end

describe 'apache2' do
  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end

  describe command('apachectl -M') do
    its(:stdout) { should contain 'php5_module' }
    its(:stdout) { should contain 'rewrite_module' }
  end
end

describe 'php5' do 
  describe package('php5') do
    it { should be_installed }
  end

  # TODO: /etc/php5/apache2/php.ini をチェックしてくれてない
  #describe php_config('date.timezone') do
  #  its(:value) { should eq 'Asia/Tokyo' }
  #end
end

describe 'mysql-server' do
  describe package('mysql-server') do
    it { should be_installed }
  end

  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end
end

describe 'wp-cli' do
  describe file('/usr/local/bin/wp') do
    it { should be_file }
    it { should be_executable }
  end
end

require 'spec_helper'

describe 'idran.geeksoc.org' do
  let(:node) { 'abydos.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'CentOS'} }
  
  it {should compile}
  
  it { should contain_service('sshd') }
  
  it { should contain_mount('/home') }
  
  it { should contain_apache__website('geeksoc.org') }
  it do
    should contain_file('geeksoc.org.conf') \
    .with_path('/etc/httpd/conf.d/geeksoc.org.conf')
  end
  
  it do
       should_not contain_file('/etc/ssh/sshd_config') \
       .with_content(/AllowGroups.*members/)
  end
  
  it { should contain_package('mysql-server') }
     
  it do
      should_not contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*(sysadmin-apprentice)/)
  end
    
  it do
      should contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*sysadmin([^-]|$)/)
  end
end
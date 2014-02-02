require 'spec_helper'

describe 'mirror.geeksoc.org' do
  let(:node) { 'mirror.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it {should compile}
  
  it { should contain_service('ssh') }
  
  it { should contain_apache__website('mirror.geeksoc.org') }
  it do
    should contain_file('mirror.geeksoc.org.conf') \
    .with_path('/etc/apache2/sites-enabled/mirror.geeksoc.org.conf')
  end
  
  it {should_not contain_cron('rsyncFOSDEM')}
  
  it do
       should_not contain_file('/etc/ssh/sshd_config') \
       .with_content(/AllowGroups.*members/)
  end
      
  it do
      should_not contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*(sysadmin-apprentice)/)
  end
    
  it do
      should contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*sysadmin([^-]|$)/)
  end
end
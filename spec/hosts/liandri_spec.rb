require 'spec_helper'

describe 'liandri.geeksoc.org' do
  let(:node) { 'liandri.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it { should compile }
  it { should contain_service('ssh') }
  
  it do
       should_not contain_file('/etc/ssh/sshd_config') \
       .with_content(/AllowGroups.*members/)
  end
  
  it do
      should contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*(sysadmin-games)/)
  end
  
  it do
      should_not contain_file('/etc/ssh/sshd_config') \
      .with_content(/AllowGroups.*(sysadmin-apprentice)/)
  end
  
  it do
       should contain_file('/etc/sudoers') \
       .with_content(/%sysadmin([^-]|$)/)
  end
  
  it do
       should contain_file('/etc/sudoers') \
       .with_content(/%sysadmin-games([^-]|$)/)
  end
  
  it do
       should_not contain_file('/etc/sudoers') \
       .with_content(/%sysadmin-apprentice([^-]|$)/)
  end
end
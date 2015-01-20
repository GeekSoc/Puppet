require 'spec_helper'

describe 'abydos.geeksoc.org' do
  let(:node) { 'abydos.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it { should compile }
  it { should contain_service('ssh') }
  it { should contain_mount('/home') }
  it { should contain_package('irssi') }
  
  it do
       should contain_file('/etc/ssh/sshd_config') \
       .with_content(/AllowGroups.*members/)
  end
  
  it do
       should contain_file('/etc/resolv.conf') \
       .with_content(/130.159.141.75/)
  end
  
  it do
       should contain_file('/etc/ntp.conf') \
       .with_content(/server ntp0.net.strath.ac.uk/)
  end
  
  it do
       should contain_file('/etc/sudoers') \
       .with_content(/%sysadmin([^-]|$)/)
  end
  
  it do
       should_not contain_file('/etc/sudoers') \
       .with_content(/%sysadmin-apprentice([^-]|$)/)
  end
end

require 'spec_helper'

describe 'abydos.geeksoc.org' do
  let(:node) { 'abydos.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian', :ipaddress => '130.159.141.65'} }
  
  it {should compile}
  it { should contain_service('ssh') }
  it { should contain_mount('/home') }
  it { should contain_package('irssi') }
  
  it do
       should contain_file('/etc/ssh/sshd_config') \
       .with_content(/AllowGroups members/)
     end
end
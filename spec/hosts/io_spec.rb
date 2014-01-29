require 'spec_helper'

describe 'io.geeksoc.org' do
  let(:node) { 'io.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it {should compile}
  
  it { should_not contain_mount('/home') }
  
  
  it do
    should contain_file('/etc/haproxy/haproxy.cfg') \
    .with_content(/server idran 130.159.141.81:80/) \
    .with_content(/use_backend linn_fusion_stream if req_fusion_stream/)
  end
  
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
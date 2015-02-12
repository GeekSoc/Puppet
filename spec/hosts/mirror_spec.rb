require 'spec_helper'
require 'shared_context.rb'


describe 'mirror.geeksoc.org' do
  include_context "debian node"
  let(:node) { 'mirror.geeksoc.org' }
  
  it {should compile}
  
  it { should contain_service('ssh') }
  
  it { should contain_custom__apache__website('mirror.geeksoc.org') }
  
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

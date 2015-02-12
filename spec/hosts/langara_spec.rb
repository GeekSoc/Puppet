require 'spec_helper'
require 'shared_context.rb'

describe 'langara.geeksoc.org' do
  let(:node) { 'langara.geeksoc.org' }
  include_context "debian node"
  
  it {should compile}
  
  it { should_not contain_mount('/home') }
  
  it do
    should contain_class('dovecot') \
    .with_postmaster_address('postmaster@geeksoc.org')
  end
  
  it do
       should contain_file('/etc/postfix/main.cf') \
       .with_content(/virtual_alias_maps = ldap:\/etc\/postfix\/ldap_virtual_aliases.cf/)
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

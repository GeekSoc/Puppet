require 'spec_helper'

describe 'irc.geeksoc.org' do
  let(:node) { 'irc.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it {should compile}
  
  it { should_not contain_mount('/home') }
  
  it do
    should contain_cron('ircdBackup') \
    .with_command('/usr/bin/rsync -arv /home/ircd/ 130.159.141.117:/home/backup/ircd --delete')
  end
  
  it do
    should contain_file('/home/ircd/ircd/unrealircd.conf') \
    .with_content(/default-server 		"irc.geeksoc.org";/) \
    .with_content(/oper tolien/)
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
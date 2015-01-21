shared_context "debian node" do
  let :facts do
    {
      :concat_basedir => '/foo', :operatingsystem => 'Debian',:osfamily => 'Debian', :operatingsystemrelease => '7.8'
    }
  end
end
shared_context "centos node" do
  let :facts do
    {
      :concat_basedir => '/foo', :operatingsystem => 'CentOS',:osfamily => 'RedHat', :operatingsystemrelease => '7.1'
    }
  end
end

require 'spec_helper'

describe 'pandora.geeksoc.org' do
  let(:node) { 'pandora.geeksoc.org' }
  let(:facts) { {:operatingsystem => 'Debian'} }
  
  it { should compile }
  it { should contain_service('mumble-server') }
end
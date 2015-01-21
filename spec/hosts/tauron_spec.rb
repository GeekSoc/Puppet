require 'spec_helper'


describe 'tauron.geeksoc.org' do
  include_context "debian node"
  let(:node) { 'tauron.geeksoc.org' }
  
  it {should compile}
  
  it { should contain_service('ssh') }
end

require 'spec_helper'

describe 'eridani-2.geeksoc.org' do
  let(:node) { 'eridani-2.geeksoc.org' }
  let(:facts) {{:operatingsystem => 'Solaris' }}
  
  it {should compile}
  
  it { should_not contain_mount('/home') }
  it { should contain_class('global') }
  
end

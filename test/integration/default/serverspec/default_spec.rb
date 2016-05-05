require 'spec_helper'

describe 'install-mongo::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe package('mongodb-org') do
    it { should be_installed }
  end
  describe service('mongod') do
    it { should be_enabled }
    it { should be_running }
  end
  describe port('27017') do
    it { should be_listening }
  end
end

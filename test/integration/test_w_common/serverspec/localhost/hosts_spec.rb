require 'spec_helper'

describe 'w_comman::hosts' do

  describe host('localhost') do
    it { should be_resolvable.by('hosts') }
    its(:ipaddress) { should eq '127.0.0.1' }
  end

	describe host('chefserver.examplechefserver.com') do
    it { should be_resolvable.by('hosts') }
    its(:ipaddress) { should eq '10.10.1.84' }
  end

# following tests does not pass in w_common test as this config applied only
# in w_apache, w_mysql, w_percona roles
#
  #describe host('0webapp.examplewebsite.com') do
  #  it { should be_resolvable.by('hosts') }
  #  its(:ipaddress) { should eq '172.31.3.12' }
  #end
  #
  #describe host('0db.examplewebsite.com') do
  #  it { should be_resolvable.by('hosts') }
  #  its(:ipaddress) { should eq '172.31.6.12' }
  #end

end
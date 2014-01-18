require 'spec_helper'

describe Fedoracoin do
  before :each do
    FakeWeb.register_uri(:post, "http://user:pass@localhost:8332", :response => fixture('getbalance'))
  end
  
  it "as a function" do
    cli = Fedoracoin($user, $pass)
    cli.balance.should == 0.001
  end
  
  it "DSL, included" do
    class << self
      include Fedoracoin
    end
    
    username $user
    password $pass
    
    balance.should == 0.001
  end
  
  it "DSL, extended" do
    class << self
      include Fedoracoin
      
      username $user
      password $pass
      
      balance.should == 0.001
    end
  end
end

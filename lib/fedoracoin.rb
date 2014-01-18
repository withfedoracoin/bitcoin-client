module Fedoracoin
  autoload :Client, 'fedoracoin/client'
  autoload :API,    'fedoracoin/api'
  autoload :Request,'fedoracoin/request'
  autoload :RPC,    'fedoracoin/rpc'
  autoload :Errors, 'fedoracoin/errors'
  autoload :Version,'fedoracoin/version'
  autoload :VERSION,'fedoracoin/version'
  autoload :DSL,    'fedoracoin/dsl'
  
  def self.included(base)
    base.send(:include, Fedoracoin::DSL)
    base.send(:extend,  Fedoracoin::DSL)
  end
end

def Fedoracoin(user, pass, options = {})
  ::Fedoracoin::Client.new(user, pass, options)
end

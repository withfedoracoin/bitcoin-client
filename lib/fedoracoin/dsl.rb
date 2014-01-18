module Fedoracoin::DSL
  def fedoracoin
    if self.class.respond_to?(:fedoracoin)
      @client ||= Fedoracoin::Client.new(self.class.fedoracoin.user, self.class.fedoracoin.pass, self.class.fedoracoin.options)
    else
      @client ||= Fedoracoin::Client.new(nil, nil)
    end
  end
  
  def username=(value)
    fedoracoin.user = value
  end
  
  def password=(value)
    fedoracoin.pass = value
  end
  
  def host=(value)
    fedoracoin.host = value
  end
  
  def port=(value)
    fedoracoin.port = value
  end
  
  def ssl=(value)
    fedoracoin.ssl = value
  end
  
  def username(value = nil)
    value ? fedoracoin.user = value : fedoracoin.user
  end
  
  def password(value = nil)
    value ? fedoracoin.pass = value : fedoracoin.pass
  end
  
  def host(value = nil)
    value ? fedoracoin.host = value : fedoracoin.host
  end
  
  def port(value = nil)
    value ? fedoracoin.port = value : fedoracoin.port
  end
  
  def ssl(value = nil)
    value.nil? ? fedoracoin.ssl : fedoracoin.ssl = value
  end
  
  def ssl?
    fedoracoin.ssl?
  end
  
  
  # Safely copies wallet.dat to destination, which can be a directory or a path with filename. 
  def backupwallet(destination)
    fedoracoin.backupwallet destination
  end
  
  # Returns the account associated with the given address. 
  def getaccount(fedoracoinaddress)
    fedoracoin.getaccount fedoracoinaddress
  end
  
  # Returns the current fedoracoin address for receiving payments to this account. 
  def getaccountaddress(account)
    fedoracoin.getaccountaddress account
  end
  
  #	Returns the list of addresses for the given account. 
  def getaddressesbyaccount(account)
    fedoracoin.getaddressesbyaccount account
  end
  
  # If +account+ is not specified, returns the server's total available balance.
  # If +account+ is specified, returns the balance in the account.
  def getbalance(account = nil, minconf = 1)
    fedoracoin.getbalance account, minconf
  end
  
  # Dumps the block existing at specified height.
  # Note: this is not available in the official release
  def getblockbycount(height)
    fedoracoin.getblockbycount height
  end
  
  # Dumps the block existing with specified hash.
  def getblock(hash)
    fedoracoin.getblock hash
  end

  # Returns the number of blocks in the longest block chain.
  def getblockcount
    fedoracoin.getblockcount
  end
  
  # Returns the block number of the latest block in the longest block chain. 
  def getblocknumber
    fedoracoin.getblocknumber
  end
  
  # Returns the number of connections to other nodes.
  def getconnectioncount
    fedoracoin.getconnectioncount
  end
  
  # Returns the proof-of-work difficulty as a multiple of the minimum difficulty. 
  def getdifficulty
    fedoracoin.getdifficulty
  end
  
  # Returns true or false whether fedoracoind is currently generating hashes 
  def getgenerate
    fedoracoin.getgenerate
  end
  
  # Returns a recent hashes per second performance measurement while generating. 
  def gethashespersec
    fedoracoin.gethashespersec
  end

  # Returns an object containing various state info. 
  def getinfo
    fedoracoin.getinfo
  end

  # Returns an object containing various mining info.
  def getmininginfo
    fedoracoin.getmininginfo
  end

  # Returns a new fedoracoin address for receiving payments. If +account+ is specified (recommended),
  # it is added to the address book so payments received with the address will be credited to +account+.
  def getnewaddress(account = nil)
    fedoracoin.getnewaddress account
  end
  
  # Returns the total amount received by addresses with +account+ in transactions
  # with at least +minconf+ confirmations. 
  def getreceivedbyaccount(account, minconf = 1)
    fedoracoin.getreceivedbyaccount account, minconf
  end
  
  # Returns the total amount received by +fedoracoinaddress+ in transactions with at least +minconf+ confirmations. 
  def getreceivedbyaddress(fedoracoinaddress, minconf = 1)
    fedoracoin.getreceivedbyaddress fedoracoinaddress, minconf
  end
  
  # Get detailed information about +txid+ 
  def gettransaction(txid)
    fedoracoin.gettransaction txid
  end
  
  # If +data+ is not specified, returns formatted hash data to work on:
  #
  #  :midstate => precomputed hash state after hashing the first half of the data
  #  :data     => block data
  #  :hash1    => formatted hash buffer for second hash
  #  :target   => little endian hash target 
  #
  # If +data+ is specified, tries to solve the block and returns true if it was successful.
  def getwork(data = nil)
    fedoracoin.getwork data
  end
  
  # List commands, or get help for a command. 
  def help(command = nil)
    fedoracoin.help command
  end
  
  # Returns Object that has account names as keys, account balances as values. 
  def listaccounts(minconf = 1)
    fedoracoin.listaccounts minconf
  end
  
  # Returns an array of objects containing:
  # 
  #   :account       => the account of the receiving addresses
  #   :amount        => total amount received by addresses with this account
  #   :confirmations => number of confirmations of the most recent transaction included
  #
  def listreceivedbyaccount(minconf = 1, includeempty = false)
    fedoracoin.listreceivedbyaccount minconf, includeempty
  end
  
  # Returns an array of objects containing:
  # 
  #   :address       => receiving address
  #   :account       => the account of the receiving address
  #   :amount        => total amount received by the address
  #   :confirmations => number of confirmations of the most recent transaction included 
  # 
  # To get a list of accounts on the system, execute fedoracoind listreceivedbyaddress 0 true
  def listreceivedbyaddress(minconf = 1, includeempty = false)
    fedoracoin.listreceivedbyaddress minconf, includeempty
  end
  
  # Returns up to +count+ most recent transactions for account +account+. 
  def listtransactions(account, count = 10)
    fedoracoin.listtransactions account, count
  end
  
  # Move from one account in your wallet to another. 
  def move(fromaccount, toaccount, amount, minconf = 1, comment = nil)
    fedoracoin.move fromaccount, toaccount, amount, minconf, comment
  end
  
  # +amount+ is a real and is rounded to 8 decimal places. Returns the transaction ID if successful. 
  def sendfrom(fromaccount, tofedoracoinaddress, amount, minconf = 1, comment = nil, comment_to = nil)
    fedoracoin.sendfrom fromaccount, tofedoracoinaddress, amount, minconf, comment, comment_to
  end
  
  # +amount+ is a real and is rounded to 8 decimal places 
  def sendtoaddress(fedoracoinaddress, amount, comment = nil, comment_to = nil)
    fedoracoin.sendtoaddress fedoracoinaddress, amount, comment, comment_to
  end
  
  # Sets the account associated with the given address. 
  def setaccount(fedoracoinaddress, account)
    fedoracoin.setaccount fedoracoinaddress, account
  end
  
  # +generate+ is true or false to turn generation on or off.
  # Generation is limited to +genproclimit+ processors, -1 is unlimited.
  def setgenerate(generate, genproclimit = -1)
    fedoracoin.setgenerate generate, genproclimit
  end
  
  # Stop fedoracoin server. 
  def stop
    fedoracoin.stop
  end
  
  # Return information about +fedoracoinaddress+. 
  def validateaddress(fedoracoinaddress)
    fedoracoin.validateaddress
  end
  
  alias account getaccount
  alias account_address getaccountaddress
  alias addresses_by_account getaddressesbyaccount
  alias balance getbalance
  alias block_by_count getblockbycount
  alias block_count getblockcount
  alias block_number getblocknumber
  alias connection_count getconnectioncount
  alias difficulty getdifficulty
  alias generate? getgenerate
  alias hashes_per_sec gethashespersec
  alias info getinfo
  alias mininginfo getmininginfo
  alias new_address getnewaddress
  alias received_by_account getreceivedbyaccount
  alias received_by_address getreceivedbyaddress
  alias transaction gettransaction
  alias work getwork
  alias get_work getwork
  alias accounts listaccounts
  alias list_received_by_account listreceivedbyaccount
  alias list_received_by_address listreceivedbyaddress
  alias transactions listtransactions
  alias list_transactions listtransactions
  alias send_from sendfrom
  alias send_to_address sendtoaddress
  alias account= setaccount
  alias set_account setaccount
  alias generate= setgenerate
  alias set_generate setgenerate
  alias validate_address validateaddress
end

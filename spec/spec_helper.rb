require 'coveralls'
Coveralls.wear!

require 'fakeweb'

# fedoracoin user settings
$user = 'user'
$pass = 'pass'

require File.expand_path('../lib/fedoracoin-client', File.dirname(__FILE__))

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each { |f| require f }

RSpec.configure do |c|
  c.include FixturesHelper
  c.before { FakeWeb.allow_net_connect = false }
  c.after  { FakeWeb.allow_net_connect = true  }
end

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'inventory-bot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    InventoryBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run InventoryBot::Web

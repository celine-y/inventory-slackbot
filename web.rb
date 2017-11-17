require 'sinatra/base'

module InventoryBot
  class Web < Sinatra::Base
    get '/' do
      'Inventory all day.'
    end
  end
end

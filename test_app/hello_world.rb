require "sinatra"

class HelloWorld < Sinatra::Base
  get "/" do
    "Hello FI-Content2 !"
  end
end

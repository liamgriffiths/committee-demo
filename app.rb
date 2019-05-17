require "sinatra"
require "json"

get "/hello" do
  content_type :json

  JSON.generate({ 
    hello: "world",
    whoops: 777,
  })
end

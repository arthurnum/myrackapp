require 'pg'
require 'rack'
require 'puma'


require_relative 'config.rb'
require_relative 'index.rb'

include MyRackApp::Config

puma = Rack::Handler.get(:puma)

app = Rack::Builder.app do
  use Rack::Lint
  use Rack::Static, urls: ["/bootstrap", "/scripts"]

  map "/" do
    run Index.new
  end

  map "/hi" do
    run proc {|env| [200, {"Content-Type" => "text/html"}, ["sdfsdfdsf"]]}
  end
end

puma.run app, Port: 3002

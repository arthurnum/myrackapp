require 'rack'
require 'puma'


require_relative 'config.rb'
require_relative 'index.rb'
require_relative 'agents.rb'
require_relative 'domain/agent'

include MyRackApp::Config

puma = Rack::Handler.get(:puma)

app = Rack::Builder.app do
  use Rack::Lint
  use Rack::Static, urls: ["/bootstrap", "/scripts", "/templates"]

  map "/" do
    run Index.new
  end

  map "/hi" do
    run Agents.new
  end
end

puma.run app, Port: 3002

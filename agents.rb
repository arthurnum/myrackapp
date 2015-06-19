require 'rack'

require_relative 'domain/agent'

class Agents

  def call(env)
    req = Rack::Request.new(env)
    Domain::Agent.create(req) if req.post?
    body = Domain::Agent.select_all
    Domain::Agent.close_connection
    [200, {"Content-Type" => "application/json"}, [body]]
  end

end

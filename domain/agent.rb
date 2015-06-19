require 'pg'
require 'json_builder'

require_relative '../config'

module Domain
  class Agent

    attr_accessor :id, :contact_id

    class << self

      def select_all
        conn = PG.connect(MyRackApp::Config::DB_CONFIG)
        res = conn.exec("SELECT * FROM agents;")
        conn.close
        json = JSONBuilder::Compiler.generate do
          fields res.fields
        end
      end

    end

  end
end

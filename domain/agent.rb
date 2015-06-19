require 'pg'
require 'json_builder'

require_relative '../config'

module Domain
  class Agent

    attr_accessor :id, :contact_id

    class << self

      def connection
        @@connection ||= PG.connect(MyRackApp::Config::DB_CONFIG)
      end

      def close_connection
        @@connection.close
        @@connection = nil
      end

      def select_all
        res = connection.exec("SELECT * FROM agents;")
        data_array = []
        res.each do |row|
          data_array << row
        end

        json = JSONBuilder::Compiler.generate do
          fields res.fields
          rows data_array
        end
      end

      def create(req)
        params = JSON.parse(req.body.read)
        res = connection.exec("INSERT INTO agents (name) VALUES ('#{params['name']}');")
      end

    end

  end
end

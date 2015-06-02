require 'erb'

require_relative '../config.rb'

module Lib
  include MyRackApp::Config

  class Template

    def self.file(filename)
      @@filename = filename
    end

    def template
      if @@filename
        ERB.new(File.read(@@filename)).result binding
      else
        @@filename
      end
    end

    def call(env)
      erb = ERB.new(File.read(APP_CONFIG[:main_template])).result binding
      [200, {"Content-Type" => "text/html"}, [erb]]
    end

  end
end

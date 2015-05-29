module MyRackApp
  module Config

    DB_CONFIG = {
      dbname:     'mydb'
    }

    APP_CONFIG = {
      main_template: 'main.erb'
    }
  end
end


# host
#
#     server hostname
# hostaddr
#
#     server address (avoids hostname lookup, overrides host)
# port
#
#     server port number
# connect_timeout
#
#     maximum time to wait for connection to succeed
# options
#
#     backend options
# sslmode
#
#     (disable|allow|prefer|require)
# krbsrvname
#
#     kerberos service name
# gsslib
#
#     GSS library to use for GSSAPI authentication
# service
#
#     service name to use for additional parameters

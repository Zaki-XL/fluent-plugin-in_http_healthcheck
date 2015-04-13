module Fluent
  class HttpHealthCheckInput < HttpInput
    Plugin.register_input('http_healthcheck', self)
    def on_request(path_info, params)
      begin
        return ["200 OK", {'Content-type'=>'text/plain'}, ":) < Hello!"]
      end
    end
  end
end

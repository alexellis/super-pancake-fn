require "net/http"
require "net/https"

require "uri"

class Handler
    def run(req)

        if req.length == 0
            return "Pass in a URL to ping"
        end

        uri = URI.parse(req)

        if req.start_with?("https") == true
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(uri.request_uri)
            response = http.request(request)

            return "The code for the HTTPS URL was: #{response.code}"
        else
            response = Net::HTTP.get_response(uri)

            http = Net::HTTP.new(uri.host, uri.port)
            response = http.request(Net::HTTP::Get.new(uri.request_uri))
            return "The code for the URL was: #{response.code}"
        end
    end
end

# Handler.new.run("https://cli.openfaas.com/")



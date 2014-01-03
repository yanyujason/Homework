require 'net/http'
require 'uri'

class IndexController < ApplicationController

    def first


      uri = URI.parse("http://www.baidu.com")

      result = Net::HTTP.start(uri.host, uri.port) {|http|
        http.get(uri.request_uri)
      }

      response_body = result.body

      #uri = URI(URI.escape("http://www.baidu.com"))
      #http = Net::HTTP.new(uri.host, uri.port)
      #status = http.get("#{uri.path}?#{uri.query}")
      #status['content-type']
      #response_body = status.body

      replace_title response_body

      #render :text => response_body

      respond_to do |format|
        format.html { render :text =>  response_body}
      end

    end

  private
  def replace_title response
      response.gsub!(/<title>.*<\/title>/, '<title>123</title>')

  end
end
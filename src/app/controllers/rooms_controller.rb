require 'net/http'

class RoomsController < ApplicationController
  def handler
    origin = ENV['ORIGIN_HOST']
    uri = URI.parse(request.url)

    Rails.cache.write('queue_number', 1) unless Rails.cache.exist?('queue_number')
    session[:queue_number] ||= Rails.cache.increment('queue_number')

    Net::HTTP.start(origin, 80) do |http|
      response = http.get(uri.path)
      respond_to do |format|
        format.html {
          if Rails.cache.exist?('acceptable_number') && session[:queue_number] > Rails.cache.read('acceptable_number')
            queue_length = session[:queue_number] - Rails.cache.read('acceptable_number')
            render html: "#{queue_length}人待ちです。".html_safe
          else
            render html: response.body.html_safe
          end
        }
        format.any { render request.format.to_sym => response.body }
      end
    end
  end
end

class Admin::PagesController < ApplicationController
  before_action :basic_auth

  def index
    @queue_number = Rails.cache.read('queue_number')
    @acceptable_number = Rails.cache.read('acceptable_number')
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'passw0rd'
    end
  end
end

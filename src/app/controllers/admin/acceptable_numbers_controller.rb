class Admin::AcceptableNumbersController < ApplicationController
  def update
    acceptable_number = params[:acceptable_number].to_i
    Rails.cache.write('acceptable_number', acceptable_number)
    redirect_to admin_path
  end
end

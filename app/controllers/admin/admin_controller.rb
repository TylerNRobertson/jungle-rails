class Admin::AdminController < ApplicationController
   before_filter :authenticate

   private
   def authenticate
      authenticate_or_request_with_http_basic do |username, password|
         username == ENV["Username"] && password == ENV["Password"]
      end
    end
end

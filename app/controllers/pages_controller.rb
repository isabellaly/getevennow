#require 'net/http'
#require 'rexml/document'
#require 'digest/sha1'

class PagesController < ApplicationController
  def home
    @title = "Get Even Now"
  end
  
end

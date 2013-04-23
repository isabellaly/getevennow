#require 'net/http'
#require 'rexml/document'
#require 'digest/sha1'

class PagesController < ApplicationController
  def home
    @title = "Get Even Now"
  end
  
  def getthefact
    @title = "Get Even Now | Get the Facts"
  end
  
  def gettheplan
    @title = "Get Even Now | Get the Plan"
  end
  
  def getconnected
    @title = "Get Even Now | Get Connected"
  end
  
  def aboutus
    @title = "Get Even Now | About Us"
  end
end

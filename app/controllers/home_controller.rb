class HomeController < ApplicationController
  
  def show
  	@page = Page.where("featured = true")
  end

 

end

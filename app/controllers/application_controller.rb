class ApplicationController < ActionController::Base
	before_action :set_paper_trail_whodunnit
	before_action :getPageNav
	
	protected
  

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end

  def getPageNav
  	@pageNav = Page.where("is_published = true").order(order: :asc)
  end
	
end

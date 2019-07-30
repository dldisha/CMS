class Page < ApplicationRecord
 include Rails.application.routes.url_helpers 
	belongs_to :section
	  has_paper_trail

	   def admin_permalink
    admin_page_path(self)
  end
	
	attr_accessible :title, :body, :order
  	has_ancestry :orphan_strategy => :rootify

end

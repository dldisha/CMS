class Task < ApplicationRecord
	belongs_to :section
    belongs_to :admin_user
 
  validates :title, :section_id, :admin_user_id, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }
end

ActiveAdmin.register Task do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do 
    def permitted_params 
      params.permit task: [:title, :section_id, :admin_user_id, :is_done, :due_date] 
    end 
  end

  index do
    column :id
     column :title do |section|
    link_to section.title, admin_section_path(section)
  end
    column :section, :sortable => :section
    column :created_at, :sortable => :created_at
    column :order
  section.actions
 end
 
# Filter only by title
filter :title

scope :all, :default => true
scope :due_this_week do |tasks|
  tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
end
scope :late do |tasks|
  tasks.where('due_date < ?', Time.now)
end
scope :mine do |tasks|
  tasks.where(:admin_user_id => current_admin_user.id)
end
  
end

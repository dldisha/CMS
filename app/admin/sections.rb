ActiveAdmin.register Section do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :list, :of, :attributes, :on, :model
  permit_params :name

  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
 show do
  panel "Task Details" do
    attributes_table_for task do
      row("Status") { status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      row("Title") { task.title }
      row("Project") { link_to task.project.title, admin_project_path(task.project) }
      row("Assigned To") { link_to task.admin_user.email, admin_admin_user_path(task.admin_user) }
      row("Due Date") { task.due_date? ? l(task.due_date, :format => :long) : '-' } 
    end
  end
end

end

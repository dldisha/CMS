ActiveAdmin.register Page do
  
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

  permit_params :title, :body, :order, :is_published, :section_id, :menu_display

  reorderable

  controller do
  def show
      @page = Page.find(params[:id])
      @versions = @page.versions 
      @page = @page.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :versionate, :partial => "layouts/version", :only => :show

  member_action :history do
    @page = Page.find(params[:id])
    @versions = @page.versions
    render "layouts/history"
  end


  index as: :reorderable_table do
    column :id
    column :title, :sortable => :title
    column :section, :sortable => :section
    column :created_at, :sortable => :created_at
    column :order
    actions
   end


  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Title"
      f.input :section, :label => "Section Name"
      # f.input :body, as: :html_editor, :label => "Description"
      f.input :body, as: :medium_editor, input_html: { data: { options: '{"spellcheck":true,"toolbar":{"buttons":["bold","italic","underline","anchor","orderedlist","unorderedlist","strikethrough","subscript","superscript","pre","h1","h2","h3","html"]}}' } }
      f.input :order, :label => "Order"
      f.input :is_published, :label => "Published"
      f.input :menu_display, :label => "Display in menu"
      f.actions
    end
  end

  
end

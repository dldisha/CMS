ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    section "Recent Pages", :priority => 1 do
        table_for Page.order("id desc").limit(20) do
            column :id
            column "Page title", :title do |page|
                link_to page.title, [:admin, page]
            end
            column :section, :sortable => :section
            column :created_at
        end  

        section "Recently Updated Content" do
  table_for PaperTrail::Version.order('id desc').limit(20) do
      column "Item" do |v| link_to v.item, v.item.admin_permalink end
    column "Type" do |v| v.item_type.underscore.humanize end
    column "Modified at" do |v| v.created_at.to_s :long end
    # column "Admin" do |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) end
  end
end

      



end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

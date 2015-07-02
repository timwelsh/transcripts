ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
        div class: "blank_slate_container", id: "dashboard_default_message" do
            columns do
                column do
                    panel "User Management" do
                        link_to("User Management", admin_users_path)
                    end
                end
                column do
                    panel "Content Management" do
                        link_to("Content Management", admin_pages_path)
                    end
                end
                
            end
        end
        div class: "blank_slate_container" do
            columns do
                column do
                    panel "School Management" do
                        link_to("School Management", admin_schools_path)
                    end
                end
                column do
                    panel "Admin User Management" do
                        link_to("Admin User Management", admin_admin_users_path)
                    end
                end
            end
        end
    end # content
end

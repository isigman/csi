ActiveAdmin.register_page "Dashboard" do
  content :title => proc {I18n.t("active_admin.dashboard")} do
    columns do
      column do

        panel "News Articles" do
          table_for Article.all do
            column :name do |article|
              link_to article.title
            end
            column :summary
            column :link
            column :tag_list
            column :created_at
          end
        end

        panel "Users" do
          table_for User.all do
            column :email
            column :corp
            column :created_at
          end
        end

        panel "Wikis" do
          table_for Wiki.all do
            column :name
            column :author
            column :views
            #column to download
          end
        end

      end
    end
  end
end

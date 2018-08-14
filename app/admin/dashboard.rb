ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent added books" do
          ul do
            Book.where(published: true).limit(10).order("created_at DESC").map do |book|
              li link_to(book.title, admin_book_path(book))
            end
          end
        end
      end

      column do
        panel "Recent added authors" do
          ul do
            Author.limit(10).order("created_at DESC").map do |author|
              li do 
                link_to(author.name, admin_author_path(author))
              end
            end
          end
        end
      end
    end
  end # content
end

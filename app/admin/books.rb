ActiveAdmin.register Book do
  permit_params :title, :description, :published_at, :author_ids => []

  index do
    selectable_column
    column :id
    column :title
    column :author
    column :published_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :published_at
      row 'Authors' do
        ul do
          book.authors.map do |a|
            li link_to a.name, admin_author_path(a)
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      input :title
      input :description
      input :published_at
      input :author_ids, :label => 'Authors', :as => :select, multiple: true, :collection => Author.all.map{|a| ["#{a.name}", a.id]}
    end
    f.actions
  end
end

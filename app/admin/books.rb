ActiveAdmin.register Book do
  permit_params :title, :description, :published, :published_at, :author_ids => [], :category_ids => []

  index do
    selectable_column
    column :id
    column :title
    column 'Authors' do |book|
      ol do
        book.authors.map do |a|
          li link_to a.name, admin_author_path(a)
        end
      end
    end
    column 'Categories' do |book|
      ol do
        book.categories.map do |c|
          li link_to c.title, admin_category_path(c)
        end
      end
    end
    column :published
    column ('Published at') { |book| book.published_at.strftime('%d.%m.%Y %H:%M') }
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :published, :label => 'Published'
      row :published_at
      row 'Authors' do
        ul do
          book.authors.map do |a|
            li link_to a.name, admin_author_path(a)
          end
        end
      end
      row 'Categories' do
        ul do
          book.categories.map do |c|
            li link_to c.title, admin_category_path(c)
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      input :title
      input :description
      input :published
      input :published_at
      input :author_ids, :label => 'Authors', :as => :select, multiple: true, :collection => Author.all.map{|a| ["#{a.name}", a.id]}
      input :category_ids, :label => 'Categories', :as => :select, multiple: true, :collection => Category.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end
end

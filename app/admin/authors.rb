ActiveAdmin.register Author do
  permit_params :name, :email, :book_ids => []

  index do
    selectable_column
    column :id
    column :name
    column :email
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row ('Author ID') { author.id }
      row 'Books' do
        ul do
          author.books.map do |b|
            li link_to b.title, admin_book_path(b)
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      input :name
      input :email
      input :book_ids, :label => 'Books', :as => :select, multiple: true, :collection => Book.all.map{|b| ["#{b.title}", b.id]}
    end
    f.actions
  end
end

ActiveAdmin.register Category do
  permit_params :title, :book_ids => []

  show do
    attributes_table do
      row :title
      row 'Books' do
        ul do
          category.books.map do |b|
            li link_to b.title, admin_book_path(b)
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      input :title
      input :book_ids, :label => 'Books', :as => :select, multiple: true, :collection => Book.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end
end

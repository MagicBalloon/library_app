ActiveAdmin.register Category do
  permit_params :title, :book_ids => []

  form do |f|
    f.inputs 'Details' do
      input :title
      input :book_ids, :label => 'Books', :as => :select, multiple: true, :collection => Book.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end
end

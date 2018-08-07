ActiveAdmin.register Book do
  permit_params :title, :description, :published_at, :author_id

  index do
    selectable_column
    column :id
    column :title
    column :author
    column :published_at
    actions
  end
end

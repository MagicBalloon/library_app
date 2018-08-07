ActiveAdmin.register Author do
  permit_params :name, :email

  index do
    selectable_column
    column :id
    column :name
    column :email
    actions
  end
end

ActiveAdmin.register Presentation do
  permit_params :title, :about, :video, :category, :user

  index do
    selectable_column
    id_column
    column :title
    column :about
    column :goal
    column :video
    column :user
    column :category
    column :created_at
    actions
  end

  filter :title
  filter :about
  filter :goal
  filter :video
  filter :user
  filter :category
  filter :created_at

  form do |f|
    f.inputs "Presentation Details" do
      f.input :title
      f.input :about
      f.input :video
      f.input :category
    end
    f.actions
  end

end
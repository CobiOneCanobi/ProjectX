ActiveAdmin.register Feedback do
  permit_params :rating, :comment, :presentation

  index do
    selectable_column
    id_column
    column :rating
    column :comment
    column :presentation
    column :user, collection: User.all
    column :created_at
    actions
  end

  filter :rating
  filter :comment
  filter :presentation
  filter :user
  filter :created_at

  form do |f|
    f.inputs "Feedback Details" do
      f.input :rating
      f.input :comment
      f.input :presentation
    end
    f.actions
  end

end
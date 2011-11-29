ActiveAdmin.register Guess do
  index do
    column :email
    column :character
    column :correct
    column :created_at
    default_actions
  end
end

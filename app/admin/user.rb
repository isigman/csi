require 'securerandom'
ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :corp, :role

  index do
    selectable_column
    id_column
    column :email
    column :corp
    column :role
    column :sign_in_count
    column :created_at
    actions
  end

  # Create Passowrd
  random_string = SecureRandom.hex(8)

  form do |f|
    f.inputs do
      f.input :email
      f.input :password, :input_html => {:value => random_string}
      f.input :password_confirmation, :input_html => {:value => random_string}
      f.input :corp, :as => :select, :collection => Corp.all.map {|e| e.name}
      f.input :role, :as => :select, :collection => ["admin", "tax_manager", "regulatory_manager",
                                                     "tax_user", "regulatory_user"]
    end
    f.actions
  end
  #Kickoff email to user with password and login link
  puts random_string

end

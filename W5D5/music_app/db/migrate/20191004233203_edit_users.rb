class EditUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :activation_token
  end
end

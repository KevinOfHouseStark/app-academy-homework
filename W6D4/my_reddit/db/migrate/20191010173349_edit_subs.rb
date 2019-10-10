class EditSubs< ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :desciption
    add_column :subs, :description, :text, null: false
  end
end

class RenameUserIdColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :User_id, :user_id
  end
end

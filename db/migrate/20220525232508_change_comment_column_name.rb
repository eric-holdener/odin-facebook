class ChangeCommentColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :parent_id_id, :parent_id
  end
end

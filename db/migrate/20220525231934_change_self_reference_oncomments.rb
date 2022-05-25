class ChangeSelfReferenceOncomments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :parent_id
    add_reference :comments, :parent_id, foreign_key: { to_table: :comments }
  end
end

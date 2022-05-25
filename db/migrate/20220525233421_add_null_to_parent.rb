class AddNullToParent < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :parent_id, true
  end
end

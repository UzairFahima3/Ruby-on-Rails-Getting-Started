class AddImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image, :attachment
  end
end

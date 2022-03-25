class AddCoverToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cover, :string
  end
end

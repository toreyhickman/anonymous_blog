class CreatePostTagConnections < ActiveRecord::Migration
  def change
    create_table :post_tag_connections do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end

class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :text
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :code
      t.string :title
      t.text :content
      t.datetime :link_expire_at

      t.timestamps
    end

    add_index :posts, :code, unique: true
  end
end

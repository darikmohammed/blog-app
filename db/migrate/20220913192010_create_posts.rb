class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.text :Text
      t.integer :CommentCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
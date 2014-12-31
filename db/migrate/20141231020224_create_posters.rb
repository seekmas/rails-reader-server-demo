class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :subject
      t.text :content
      t.integer :click
      t.integer :author_id

      t.timestamps
    end
  end
end

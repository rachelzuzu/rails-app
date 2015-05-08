class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body

      # this line adds an integer column called article_id
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

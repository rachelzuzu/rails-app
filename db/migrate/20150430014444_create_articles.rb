class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end


# The above migration creates a method named change which will be called when you run this migration. 
# The action defined in this method is also reversible, which means Rails knows how to reverse the change made by this migration. 
# When you run this migration it will create an articles table with one string column and a text column. 
# It also creates two timestamp fields to allow Rails to track article creation and update times.


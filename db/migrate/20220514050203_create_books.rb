class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title   
      t.string :body
      t.string :user_id
      t.float :star
      t.timestamps
    end
    add_index :books,[:user_id, :created_at]
  end
end

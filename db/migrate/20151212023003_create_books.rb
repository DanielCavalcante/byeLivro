class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

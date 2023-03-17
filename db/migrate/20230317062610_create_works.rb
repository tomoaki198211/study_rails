class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end

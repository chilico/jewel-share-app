class CreateJewels < ActiveRecord::Migration[7.0]
  def change
    create_table :jewels do |t|
      t.string :title
      t.float :price
      t.text :description
      t.string :image_attachment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

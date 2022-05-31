class DeleteImageFromJewel < ActiveRecord::Migration[7.0]
  def change
    remove_column :jewels, :image_attachment
  end
end

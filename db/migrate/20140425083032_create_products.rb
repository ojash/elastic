class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :hashtags

      t.timestamps
    end
  end
end

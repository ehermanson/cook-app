class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :unit
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end

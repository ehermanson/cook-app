class RemoveQuantityUnitfromIngredients < ActiveRecord::Migration
  def change
  	remove_column :ingredients, :quantity
  	remove_column :ingredients, :unit
  end
end

class AddPriceToInsurances < ActiveRecord::Migration
  def change
    add_column :insurances, :price, :decimal,precision:7,scale:2
  end
end

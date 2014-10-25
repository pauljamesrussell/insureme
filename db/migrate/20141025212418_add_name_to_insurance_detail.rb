class AddNameToInsuranceDetail < ActiveRecord::Migration
  def change
    add_column :insurance_details, :name, :string
  end
end

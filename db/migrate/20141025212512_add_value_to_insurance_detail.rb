class AddValueToInsuranceDetail < ActiveRecord::Migration
  def change
    add_column :insurance_details, :value, :string
  end
end

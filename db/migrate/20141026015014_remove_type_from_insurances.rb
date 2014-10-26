class RemoveTypeFromInsurances < ActiveRecord::Migration
  def change
    remove_column :insurances, :type, :string
  end
end

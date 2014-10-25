class CreateInsuranceDetails < ActiveRecord::Migration
  def change
    create_table :insurance_details do |t|
      t.references :insurance, index: true

      t.timestamps
    end
  end
end

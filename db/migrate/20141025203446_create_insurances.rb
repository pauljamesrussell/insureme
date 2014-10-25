class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :type
      t.boolean :enabled
      t.references :user, index: true

      t.timestamps
    end
  end
end

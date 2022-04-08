class CreateDeliveryRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_records do |t|
      t.string :post_code                  ,null: false
      t.integer :delivery_area_id          ,null: false
      t.string :city                       ,null: false
      t.string :address                    ,null: false
      t.string :building_name   
      t.string :phone_number               ,null: false
      t.references :purchased_record       ,null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :counselor_id
      t.string :offers

      t.timestamps

    end
  end
end

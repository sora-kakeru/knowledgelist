class CreateWantOffers < ActiveRecord::Migration
  def change
    create_table :want_offers do |t|
      t.integer :offer_id
      t.integer :want_id
      t.boolean :match

      t.timestamps

    end
  end
end

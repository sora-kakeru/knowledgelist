class CreateOfferTags < ActiveRecord::Migration
  def change
    create_table :offer_tags do |t|
      t.integer :offer_id
      t.integer :tag_id

      t.timestamps

    end
  end
end

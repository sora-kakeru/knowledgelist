class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :date_time
      t.text :comment
      t.integer :user_stars
      t.integer :offer_stars
      t.integer :want_offer_id

      t.timestamps

    end
  end
end

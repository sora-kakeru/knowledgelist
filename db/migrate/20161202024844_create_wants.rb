class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.integer :user_id
      t.string :wants

      t.timestamps

    end
  end
end

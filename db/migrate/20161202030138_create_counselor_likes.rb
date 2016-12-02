class CreateCounselorLikes < ActiveRecord::Migration
  def change
    create_table :counselor_likes do |t|
      t.integer :want_id
      t.integer :counselor_id
      t.boolean :like

      t.timestamps

    end
  end
end

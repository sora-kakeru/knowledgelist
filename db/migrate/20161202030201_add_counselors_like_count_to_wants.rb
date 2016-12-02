class AddCounselorsLikeCountToWants < ActiveRecord::Migration[5.0]
  def change
    add_column :wants, :counselors_likes_count, :integer
  end
end

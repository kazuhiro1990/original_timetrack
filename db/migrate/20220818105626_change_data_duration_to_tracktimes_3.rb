class ChangeDataDurationToTracktimes3 < ActiveRecord::Migration[6.1]
  def change
    change_column :tracktimes, :duration, :integer
  end
end

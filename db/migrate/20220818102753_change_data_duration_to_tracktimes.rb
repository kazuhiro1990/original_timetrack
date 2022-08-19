class ChangeDataDurationToTracktimes < ActiveRecord::Migration[6.1]
  def change
    change_column :tracktimes, :duration, :datetime
  end
end

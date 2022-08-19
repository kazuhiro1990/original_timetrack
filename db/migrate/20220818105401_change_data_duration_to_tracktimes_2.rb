class ChangeDataDurationToTracktimes2 < ActiveRecord::Migration[6.1]
  def change
    change_column :tracktimes, :duration, :time
  end
end

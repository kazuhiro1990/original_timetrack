class CreateTracktimes < ActiveRecord::Migration[6.1]
  def change
    create_table :tracktimes do |t|
      t.string :description
      t.time :start_time
      t.time :end_time
      t.time :duration
      t.references :project

      t.timestamps
    end
  end
end

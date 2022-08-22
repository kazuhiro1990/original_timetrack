class CreateTracktimes < ActiveRecord::Migration[6.1]
  def change
    create_table :tracktimes do |t|
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.references :project

      t.timestamps
    end
  end
end

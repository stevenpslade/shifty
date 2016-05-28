class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :start_date
      t.boolean :day_shift
      t.string :notes

      t.timestamps null: false
    end
  end
end

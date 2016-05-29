class DropShiftSets < ActiveRecord::Migration
  def change
    drop_table :shift_sets
  end
end

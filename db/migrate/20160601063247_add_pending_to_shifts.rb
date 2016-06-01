class AddPendingToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :pending, :boolean
  end
end

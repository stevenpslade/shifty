class AddUserRefToShifts < ActiveRecord::Migration
  def change
    add_reference :shifts, :user, index: true, foreign_key: true
  end
end

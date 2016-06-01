class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
    change_column :shifts, :start_date, :date
  end

  def down
    change_column :shifts, :start_date, :datetime
  end
end

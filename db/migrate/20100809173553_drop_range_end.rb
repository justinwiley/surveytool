class DropRangeEnd < ActiveRecord::Migration
  def self.up
    remove_column :questions, :range_end
    rename_column :questions, :range_start, :range
  end

  def self.down
    add_column :questions, :range_end, :string
    rename_column :question, :range, :range_start
  end
end

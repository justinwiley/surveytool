class AddPositionToQuestionAndAnswer < ActiveRecord::Migration
  def self.up
    add_column :questions, :position, :integer
    add_column :answers, :position, :integer
  end

  def self.down
    remove_column :questions, :position
    remove_column :answers, :position
  end
end

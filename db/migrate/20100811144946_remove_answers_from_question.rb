class RemoveAnswersFromQuestion < ActiveRecord::Migration
  def self.up
    remove_column :questions, :answer10
    remove_column :questions, :answer9
    remove_column :questions, :answer8
    remove_column :questions, :answer7
    remove_column :questions, :answer6
    remove_column :questions, :answer5
    remove_column :questions, :answer4
    remove_column :questions, :answer3
    remove_column :questions, :answer2
    remove_column :questions, :answer1
  end
  
  def self.down
    add_column :questions, :answer1, :text
    add_column :questions, :answer2, :text
    add_column :questions, :answer3, :text
    add_column :questions, :answer4, :text
    add_column :questions, :answer5, :text
    add_column :questions, :answer6, :text
    add_column :questions, :answer7, :text
    add_column :questions, :answer8, :text
    add_column :questions, :answer9, :text
    add_column :questions, :answer10, :text
  end
end

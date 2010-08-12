class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :question
      t.string :name
      t.string :text
      t.timestamps
    end
  end
  
  def self.down
    drop_table :answers
  end
end

class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :survey
      t.string :name
      t.string :spoken
      t.integer :range_start
      t.integer :range_end
      t.timestamps
    end
  end
  
  def self.down
    drop_table :questions
  end
end

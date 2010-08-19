class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.references :respondent
      t.references :question
      t.references :answer
      t.integer :range
      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end

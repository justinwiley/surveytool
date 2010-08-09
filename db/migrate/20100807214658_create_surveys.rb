class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :name
      t.string :spoken
      t.text :desc
      t.timestamps
    end
  end
  
  def self.down
    drop_table :surveys
  end
end

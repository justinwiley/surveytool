class CreateRespondents < ActiveRecord::Migration
  def self.up
    create_table :respondents do |t|
      t.references :survey
      t.timestamps
    end
  end

  def self.down
    drop_table :respondents
  end
end

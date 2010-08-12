class CurrentSurvey < ActiveRecord::Migration
  def self.up
    create_table :current_survey do |t|
      t.references :question
      t.references :respondent
      t.timestamps
    end
  end

  def self.down
    drop_table :current_survey
  end
end

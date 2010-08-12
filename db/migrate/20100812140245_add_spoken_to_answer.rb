class AddSpokenToAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :spoken_file_name,    :string
    add_column :answers, :spoken_content_type, :string
    add_column :answers, :spoken_file_size,    :integer
    add_column :answers, :spoken_updated_at,   :datetime
  end

  def self.down
    remove_column :answers, :spoken_file_name
    remove_column :answers, :spoken_content_type
    remove_column :answers, :spoken_file_size
    remove_column :answers, :spoken_updated_at
  end
end

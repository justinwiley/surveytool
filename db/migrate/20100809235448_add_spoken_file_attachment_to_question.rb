class AddSpokenFileAttachmentToQuestion < ActiveRecord::Migration
  def self.up
    remove_column :surveys, :spoken
    add_column :surveys, :spoken_file_name,    :string
    add_column :surveys, :spoken_content_type, :string
    add_column :surveys, :spoken_file_size,    :integer
    add_column :surveys, :spoken_updated_at,   :datetime

    remove_column :questions, :spoken    
    add_column :questions, :spoken_file_name,    :string
    add_column :questions, :spoken_content_type, :string
    add_column :questions, :spoken_file_size,    :integer
    add_column :questions, :spoken_updated_at,   :datetime
  end

  def self.down
    add_column :surveys, :spoken, :string
    remove_column :surveys, :spoken_file_name
    remove_column :surveys, :spoken_content_type
    remove_column :surveys, :spoken_file_size
    remove_column :surveys, :spoken_updated_at

    add_column :questions, :spoken, :string
    remove_column :questions, :spoken_file_name
    remove_column :questions, :spoken_content_type
    remove_column :questions, :spoken_file_size
    remove_column :questions, :spoken_updated_at
  end
end

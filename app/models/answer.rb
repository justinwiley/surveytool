class Answer < ActiveRecord::Base
  attr_accessible :name, :text, :spoken

  has_attached_file :spoken
  belongs_to :question
end

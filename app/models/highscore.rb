class Highscore < ActiveRecord::Base
  attr_accessible :name, :score
  
  validates :name,  :presence => true,
                    :length => {:maximum =>50}
end

# == Schema Information
#
# Table name: highscores
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#


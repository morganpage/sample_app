class Highscore < ActiveRecord::Base
  attr_accessible :name, :score
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


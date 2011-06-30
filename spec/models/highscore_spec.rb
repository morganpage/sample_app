require 'spec_helper'

describe Highscore do
  
  before(:each) do
    @attr = { :name => "Example User", :score => 123}
  end
  
  
  it "should create a new instance given a valid attribute" do
    Highscore.create!(@attr)
  end
  
  it "should require a name" do
    no_name_hscore = Highscore.new(@attr.merge(:name => ""))
    no_name_hscore.should_not be_valid
  end
  
  #it "should require a non zero score" do
   # no_score_hscore = Highscore.new(@attr.merge(:score => 0))
   # no_score_hscore.should_not be_valid
  #end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_hscore = Highscore.new(@attr.merge(:name => long_name))
    long_name_hscore.should_not be_valid
  end
  
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


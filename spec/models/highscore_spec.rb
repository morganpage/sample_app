require 'spec_helper'
require_dependency 'secretstuff'

describe Highscore do
  
  before(:each) do
    
    inputString = "Example User" + 123.to_s + SecretStuff::SECRET_KEY
    ehash = Digest::MD5.hexdigest(inputString)
    @attr = { :name => "Example User", :score => 123, :encrypted_hash => ehash}
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
  
  describe "encrypted_hash" do
    it "should have an encrypted_hash attribute" do
      Highscore.new(@attr).should respond_to(:encrypted_hash)
    end
    
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


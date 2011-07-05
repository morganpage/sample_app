class PagesController < ApplicationController

  def home
    @title = "Home"
    @twitter = "http://twitter.com/#!/PolityAI"
    @facebook = "http://www.facebook.com/morganjpage"
  end

  def games
    @title = "Games"
  end
  
  
  
  def spacedust
    @title = "Space Dust"
    @high_scores = Highscore.find(:all, :limit => 100,
                                  :order => 'score desc')
    respond_to do |format|
      format.html  
  end  
  
  end
end

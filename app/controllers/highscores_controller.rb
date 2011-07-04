class HighscoresController < ApplicationController
  
  def new
  end

  def create # handles posts
    @highscore = Highscore.new(params[:highscore])
    respond_to do |format|
      if @highscore.save
        format.html { redirect_to(@highscore, :notice => 'Highscore was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @highscore.errors, :status => :unprocessable_entity }
        #format.json  { render :json => @highscore.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @highscore = Highscore.find(params[:id])
  end

  def index
    @high_scores = Highscore.find(:all, :limit => 100,
                                  :order => 'score desc')
    respond_to do |format|
      format.html  
      format.xml { render :xml => @high_scores }
      format.json { render :text => @high_scores }
      format.text {render "index" ,:layout => false}
  end
end
end

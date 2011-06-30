require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  
  it "should have a Games page at '/games'" do
    get '/games'
    response.should have_selector('title', :content => "Games")
  end


end

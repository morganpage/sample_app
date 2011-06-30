require 'spec_helper'

describe PagesController do

  render_views

  before(:each) do
    @base_title = "Morgan Page's Web Portal"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                                    :content => "#{@base_title} | Home")
    end

  it "should have a non-blank body" do
    get 'home'
    response.body.should_not =~ /<body>\s*<\/body>/
  end

  end

  describe "GET 'games'" do
    it "should be successful" do
      get 'games'
      response.should be_success
    end

    it "should have the right title" do
      get 'games'
      response.should have_selector("title",
                                    :content => "#{@base_title} | Games")
    end

  end
  
end

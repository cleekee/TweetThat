require 'spec_helper'

describe "LayoutLinks" do
  
  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App | "
  end
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => @base_title + "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => @base_title + "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => @base_title + "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => @base_title + "Help")
  end
  
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
end

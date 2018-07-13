class PagesController < ApplicationController
  #layout "application.html.erb", :except => :index
  layout false

  def index
    @articles = Article.all()
    render 'pages/index'
  end

  def services
    render 'pages/services', layout: 'application.html.erb'
  end

  def research_center
    @articles = Article.all()
    render 'pages/rc', layout: 'application.html.erb'
  end

  def about
    render 'pages/about', layout: 'application.html.erb'
  end

  def portal
    redirect '/users/sign_in', layout: 'application.html.erb'
  end

  def contact
    render 'pages/contact', layout: 'application.html.erb'
  end

  def events
    render 'pages/events', layout: 'application.html.erb'
  end

  def search_results
    @articles = Article.find(title.includes(params[:search_key]))
    render 'pages/rc', layout: 'application.html.erb'
  end

  def article
    @article = Article.find(params[:id])
    render 'pages/article', layout: 'application.html.erb'
  end

  def map
    render 'pages/map', layout: 'application.html.erb'
  end

  def conference_2018
    render 'pages/conference', layout: 'application.html.erb'
  end

  def trbs
    render 'pages/trbs', layout: 'application.html.erb'
  end

  def under_construction
    render 'pages/under_construction', layout: 'application.html.erb'
  end

end

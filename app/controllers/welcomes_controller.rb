class WelcomesController < ApplicationController
  def index
    if params[:search] 
      @search = Topic.search do 
        fulltext params[:search]
        paginate :page => params[:page] || 1, :per_page => 5
      end 
      @topics = @search.results
    else
      @topics = Topic.all.order("created_at desc").page(params[:page])
    end
    @categories = Category.grouped_data
  end
end

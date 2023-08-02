class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def index
    #require 'pry'; binding.pry
    @chef = Chef.find(params[:id])
    #require 'pry'; binding.pry
    
  end
end
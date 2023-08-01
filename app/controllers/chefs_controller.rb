class ChefsController < ApplicationController
  def show
    puts params.inspect
    @chef = Chef.find(params[:format])
  end
end
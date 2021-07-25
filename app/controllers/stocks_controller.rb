class StocksController < ApplicationController
  def search
    @stock = Stock.new_lookup(params[:stock])

    if @stock.nil?
      flash[:alert] = 'Please enter a valid symbol'
      redirect_to my_portfolio_path
    else
      render 'users/my_portfolio'
    end
  end
end

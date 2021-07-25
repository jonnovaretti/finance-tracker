class UserStocksController < ApplicationController
  def post
    stock = Stock.find_by(ticker: params[:ticker])

    stock = Stock.create_stock_by_ticker(params[:ticker]) if stock.nil?

    association = UserStock.find_by(user_id: current_user.id, stock_id: stock.id)
    UserStock.create(user_id: current_user.id, stock_id: stock.id) if association.nil?
  end
end

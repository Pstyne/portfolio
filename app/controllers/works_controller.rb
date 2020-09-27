class WorksController < ApplicationController
  def index
    @portfolio_items = Work.all
  end
end

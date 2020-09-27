class WorksController < ApplicationController
  def index
    @portfolio_items = Work.all
  end

  def new
    @portfolio_item = Work.new
  end

  def create
    @portfolio_item = Work.new(params.require(:work).permit(:title, :subtitle, :body))

    if @portfolio_item.save
      flash[:success] = "Portfolio item was successfully created!"
      redirect_to works_path
    else
      flash[:danger] = "Could not create portfolio item."
      render "new"
    end
  end
end

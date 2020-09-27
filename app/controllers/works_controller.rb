class WorksController < ApplicationController
  def index
    @portfolio_items = Work.all
  end

  def show
    @portfolio_item = Work.find(params[:id])
  end

  def new
    @portfolio_item = Work.new
  end

  def create
    @portfolio_item = Work.new(params.require(:work).permit(:title, :subtitle, :body))
    if @portfolio_item.save
      redirect_to works_path, notice: "Portfolio item was successfully created!"
    else
      render "new", notice: "Could not create portfolio item."
    end
  end

  def edit
    @portfolio_item = Work.find(params[:id])
  end

  def update
    @portfolio_item = Work.find(params[:id])
    if @portfolio_item.update(params.require(:work).permit(:title, :subtitle, :body))
      redirect_to works_path, notice: "Portfolio item was successfully updated!"
    else
      render "edit", notice: "Could not update portfolio item."
    end
  end

  def destroy
    @portfolio_item = Work.find(params[:id])
    @portfolio_item.destroy
    redirect_to works_path, notice: "Portfolio item was successfully deleted!"
  end
end

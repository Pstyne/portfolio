class WorksController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy] 
  layout "portfolio"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  
  def index
    @portfolio_items = Work.by_position
  end

  def sort
    params[:order].each do |key, value|
      Work.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end

  def show
  end

  def new
    @portfolio_item = Work.new
  end

  def create
    @portfolio_item = Work.new(portfolio_params)
    if @portfolio_item.save
      redirect_to works_path, notice: "Portfolio item was successfully created!"
    else
      render "new", notice: "Could not create portfolio item."
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to works_path, notice: "Portfolio item was successfully updated!"
    else
      render "edit", notice: "Could not update portfolio item."
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to works_path, notice: "Portfolio item was successfully deleted!"
  end

  private

    def set_portfolio
      @portfolio_item = Work.find(params[:id])
    end

    def portfolio_params
      params.require(:work).permit(:title, 
                                   :subtitle, 
                                   :body,
                                   :demo,
                                   :repo,
                                   :main_image,
                                   :thumb_image,
                                   technologies_attributes: [:id, :name, :_destroy])
    end
end

class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def ruby_items
    @ruby_items = Portfolio.ruby_portfolio_items
  end

  def new
    @portfolio_items = Portfolio.new
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_items.save
        # instead of sending users to the show page, bring them to the full list of portfolio items
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def update
    # duplicated code, should be DRYed later
    @portfolio_items = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        # instead of sending users to the show page, bring them to the full list of portfolio items
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    # duplicated code, should be DRYed later
    @portfolio_items = Portfolio.find(params[:id])
  end

  def destroy
    # duplicated code, should be DRYed later
    @portfolio_items = Portfolio.find(params[:id])

    # Destroy the record
    @portfolio_items.destroy

    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully removed.' }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end
end

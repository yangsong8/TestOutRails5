class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def ruby_items
    @ruby_items = Portfolio.ruby_portfolio_items
  end

  def new
    @portfolio_item = Portfolio.new

    # make 3 technologies available to the new form
    3.times { @portfolio_item.technologies.build }
  end

  def create
    # white list the technologies passed from new page
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        # instead of sending users to the show page, bring them to the full list of portfolio items
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
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

  end

  def destroy
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
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
    )
  end
end

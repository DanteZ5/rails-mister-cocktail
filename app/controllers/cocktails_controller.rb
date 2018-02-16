class CocktailsController < ApplicationController

  def index
    cocktails = Cocktail.all
    @cocktails = cocktails.sort_by { |cocktail| cocktail[:name] }
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    #white list
    params.require(:cocktail).permit(:name)
  end
end

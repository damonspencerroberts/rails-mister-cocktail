class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    @current_dose = Dose.where('cocktail_id = ?', params[:id])
  end

  def create
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new(dose_params)
    @dose.save
    redirect_to new_dose_path(@cocktail)
  end

  def delete
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:cocktail_id, :description, :ingredient_id)
  end
end

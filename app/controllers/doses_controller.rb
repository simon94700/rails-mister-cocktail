class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    raise
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end

  def destroy
    @dose.destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Doses was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
private
  # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:content)
  end
end

class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to shifts_path
    else
      render :new
    end
  end

  def update
    @shift = Shift.find(params[:id])

    if @shift.update_attributes(shift_params)
      redirect_to shifts_path(@shift)
    else
      render :edit
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path

  protected

  def shift_params
    params.require(:shift)permit(
      :start_date, :day_shift, :notes
    )
  end
end

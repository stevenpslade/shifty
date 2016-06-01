class ShiftsController < ApplicationController
  before_filter :restrict_access, except: [:index, :show]
  before_filter :require_permission, only: [:edit, :destroy]

  def index
    @shifts = Shift.all
    @shifts_by_date = @shifts.group_by(&:start_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
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
    @shift.user_id = current_user.id

    if @shift.save
      redirect_to shifts_path
    else
      render :new
    end
  end

  def update
    @shift = Shift.find(params[:id])

    if @shift.update_attributes(shift_params)
      redirect_to shift_path(@shift)
    else
      render :edit
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path
  end

  protected

  def shift_params
    params.require(:shift).permit(:start_date, :day_shift, :notes, :pending)
  end

  def require_permission
    if current_user.id != Shift.find(params[:id]).user_id
      flash[:alert] = "That's not yours!"
      redirect_to root_path
    end
  end

end

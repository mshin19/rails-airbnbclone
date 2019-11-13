class ReservationsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new
    authorize @reservation
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @flat = Flat.find(params[:flat_id])
    @reservation.user = current_user
    @reservation.flat = @flat
    authorize @reservation

    if @reservation.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to flats_path
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end

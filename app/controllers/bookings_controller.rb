class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = Room.find(params[:room_id])
    if @booking.number_of_adults + @booking.number_of_childs > @booking.room.number_of_guests
      flash[:alert] = "You can't book more guests than the room can host"
      render :new
    end

    if @booking.save
      redirect_to room_path(@booking.room)
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :number_of_adults, :status, :payment, :first_name, :last_name, :email, :phone_number, :number_of_childs, :civility)
  end
end

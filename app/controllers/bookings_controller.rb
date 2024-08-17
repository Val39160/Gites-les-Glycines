class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
  end
end

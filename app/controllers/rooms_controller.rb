class RoomsController < ApplicationController

  def index
    @rooms = Room.all

  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
  end
end

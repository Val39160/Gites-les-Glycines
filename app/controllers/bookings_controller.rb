class BookingsController < ApplicationController
  before_action :set_room, only: [:new, :create]

  def payment

    if @booking.payment_pending?
      @booking.payment.stripe_init_intent
    end
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = Room.find(params[:room_id])

    # Vérification du nombre de personnes par rapport à la capacité de la chambre
    if @booking.number_of_adults + @booking.number_of_childs > @booking.room.number_of_guests
      flash[:alert] = "You can't book more guests than the room can host"
      return render :new
    end

    if @booking.save
      # Crée et sauvegarde un paiement via Payify
     redirect_to room_booking_path(@room, @booking)
      else
        # Si le paiement échoue, retourner au formulaire de réservation
        flash[:alert] = "Erreur lors de la création de la réservation"
        render :new


    end
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :number_of_adults, :total_price, :first_name, :last_name, :email, :phone_number, :number_of_childs, :civility)
  end
end

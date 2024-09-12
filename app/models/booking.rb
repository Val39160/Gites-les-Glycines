class Booking < ApplicationRecord
  include ::Payify::HasPaymentConcern
  after_save :create_payment
  belongs_to :room
  belongs_to :user



  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_adults, presence: true


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :civility, presence: true


  def amount_to_pay
    total_price
  end


end

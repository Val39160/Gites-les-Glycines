class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  attribute :payment, :string, default: 'en attente'

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_adults, presence: true
  validates :status, presence: true
  validates :payment, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :civility, presence: true

end

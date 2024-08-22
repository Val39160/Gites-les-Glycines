class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def centre_bien_etre
  end

  def tarifs
    @rooms = Room.all
  end
end

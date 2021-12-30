class HomeController < ApplicationController
  def index
    @residents = Resident.all
    @centers = Center.all
    @nurses = Nurse.all.order(:center_id, center_id: :desc)
  end

  def terms; end

  def privacy; end
end

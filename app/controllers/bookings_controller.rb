class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings or /bookings.json
  def create
    resident = Resident.find_by(nric: params[:resident_nric])
    @booking = Booking.new(resident_id: resident.id, slot_id: params[:slot_id]) unless resident.nil?

    respond_to do |format|
      if @booking.nil?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: '{"error": "resident not found with given nric"}', status: :unprocessable_entity }
      elsif @booking.save
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    # slot = Slot.find_by(id: params[:slot_id])
    # slot_booking_count = slot.bookings.count
    # slot_capacity = slot.capacity

    respond_to do |format|
      # if slot_booking_count < slot_capacity
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
      # else
      #   format.html { render :edit, status: :unprocessable_entity }
      #   format.json { render json: '{"error": "slot is full"}', status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:resident_id, :slot_id, :resident_nric)
  end

  # def resident_params
  #   params.permit(:resident_nric)
  # end
end

class ReservationsController < ApplicationController
  before_action :get_reservations, only: [:index]

  rescue_from ArgumentError do |exception|
    redirect_to :root, alert: exception.message.capitalize
  end


  def create
    reserved_at = DateTime.strptime(reservation_params[:reserved_at], "%d-%m-%Y %I:%M %p")
    reservation_params[:reserved_at] = reserved_at

    table_ids = RestaurantTable.with_capacity(reservation_params[:group_size].to_i)
    reserved_tables = Reservation.for_tables(table_ids).reserved_at(reserved_at)

    available_table_ids = table_ids - reserved_tables

    @reservation = Reservation.new(reservation_params).tap do |reservation|
      #This will assign the smallest table that can seat the group
      #because capcity of a table with higher id is greater than or equal to that
      #of a table with a smaller id
      reservation.restaurant_table_id = available_table_ids.min
    end

    if @reservation.save
      flash[:alert] = 'Reservation created!'
    else
      flash[:alert] = 'Could not create reservation. '
    end

    flash[:alert] += @reservation.errors.full_messages.compact.join('. ')
    redirect_to :root
  end

  private

  def get_reservations
    @reservations = Reservation.all
  end

  def reservation_params
    params.require(:reservation).permit(:customer_name, :reserved_at, :group_size)
  end

end

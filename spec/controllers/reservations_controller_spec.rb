require 'spec_helper'

describe ReservationsController do
  let(:customer_name) { 'Ajay' }
  let(:group_size) { 2 }
  let(:reserved_at) { '28-09-2015 09:00 PM' }

  context "POST create with valid params" do
    let(:params) { { reservation: { customer_name: customer_name, group_size: group_size, reserved_at: reserved_at } } }

    it "should create the reservation" do
      expect{ post :create, params }.to change{ Reservation.count }.by(1)
    end
  end

  context "POST create with invalid params" do
    let(:params) { { reservation: { customer_name: customer_name, group_size: '', reserved_at: reserved_at } } }

    it "should not create a reservation" do
      expect{ post :create, params }.to_not change{ Reservation.count }
    end
  end

  #Other examples of invalid params omitted, but can be written as above.
end

require 'spec_helper'

describe Reservation do
  context 'with valid attributes' do
    it 'should save the reservation' do
      reservation = Reservation.create(customer_name: 'Ajay', group_size: 2, reserved_at: DateTime.strptime('30-09-2015 09:00 PM', '%d-%m-%Y %I:%M %p'), restaurant_table_id: 2)
      expect(reservation.id).to be
    end
  end

  context 'with invalid attributes' do
    it 'should not save the reservation' do
      reservation = Reservation.create(customer_name: 'Ajay', group_size: 2, reserved_at: DateTime.strptime('30-09-2015 09:00 PM', '%d-%m-%Y %I:%M %p'), restaurant_table_id: nil)
      expect(reservation.id).to eq nil
    end
  end
end

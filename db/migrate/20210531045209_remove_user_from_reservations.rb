class RemoveUserFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reservations, :user, null: false, foreign_key: true
  end
end

class AddPhoneNumberToSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :sending_destinations, :phone_number, :string
  end
end

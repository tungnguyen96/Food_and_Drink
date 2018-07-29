class AddAddressDeliveryPaymentToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :delivery, :string
    add_column :orders, :payment, :string
  end
end

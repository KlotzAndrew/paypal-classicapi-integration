class AddParamsStatusTransactionIdPurchasedAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :notification_params, :text
    add_column :tickets, :status, :string
    add_column :tickets, :transaction_id, :string
    add_column :tickets, :purchased_at, :datetime
  end
end

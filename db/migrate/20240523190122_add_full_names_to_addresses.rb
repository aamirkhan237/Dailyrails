class AddFullNamesToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :country_full, :string
    add_column :addresses, :state_full, :string
  end
end

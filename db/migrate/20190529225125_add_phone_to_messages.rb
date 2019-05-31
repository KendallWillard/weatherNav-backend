class AddPhoneToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :phone, :string
  end
end

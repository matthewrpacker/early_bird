class UpdatePhoneColumnOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :phone, '3334445555')
  end
end

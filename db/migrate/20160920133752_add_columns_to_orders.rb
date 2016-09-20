class AddColumnsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :course_name, :string
    add_column :orders, :course_id, :integer
    add_column :orders, :tee_off_at, :datetime
    add_column :orders, :quantity, :integer
    add_column :orders, :unit_price, :decimal, precision: 8, scale: 2
  end
end

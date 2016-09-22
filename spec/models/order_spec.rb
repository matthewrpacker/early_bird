require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }

  it "should validate the format of unit price" do
    order = create_order

    expect(order.format_price(order.unit_price)).to eq('27.00')
  end

  it "should validate the format of date" do
    order = create_order

    expect(order.date(order.tee_off_at)).to eq('Nov 30, 2016')
  end

  it "should validate the format of time" do
    order = create_order

    expect(order.time(order.tee_off_at)).to eq(' 3:40 PM')
  end
end

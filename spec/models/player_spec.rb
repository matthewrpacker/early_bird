require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should belong_to :user }
end

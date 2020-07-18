require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, and email' do
    user = User.new(
      name: 'testName',
      email: 'test@example.com'
    )
    expect(user).to be_valid
  end

  it 'is valid without a name, and email' do
    user = User.new(
      name: nil,
      email: nil
    )
    expect(user).to be_valid
  end
end

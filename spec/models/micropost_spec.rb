require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { create(:micropost) }

  before do
    @user = create(:user)
  end

  it 'can make micropost' do
    expect(micropost).to be_valid
  end

  it 'can make micropost in 140 characters' do
    micropost = Micropost.new(
      user_id: @user.id,
      content: 'a' * 140
    )
    expect(micropost).to be_valid
  end

  it 'can`t make micropost in 141 characters' do
    micropost = Micropost.new(
      user_id: @user.id,
      content: 'a' * 141
    )
    micropost.valid?
    expect(micropost.errors[:content]).to include('is too long (maximum is 140 characters)')
  end

  it 'can`t make a micropost with a non-existent user_id.' do
    micropost = Micropost.new(
      user_id: 10_000,
      content: 'test content'
    )
    micropost.valid?
    expect(micropost.errors[:user]).to include('must exist')
  end
end

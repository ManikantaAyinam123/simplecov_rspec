require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is valid with valid attributes' do
    user = User.new(name: 'john_doe', email: 'john@example.com')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com')
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(name: 'john_doe')
    expect(user).not_to be_valid
  end
end

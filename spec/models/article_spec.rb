require 'rails_helper'

RSpec.describe Article, type: :model do

  it 'is valid with valid attributes' do
  
    user= User.create(name: "kim", email:"kim@gmail.com")
    article = Article.new(title: 'Sample Article', content: 'This is the content.', user_id: user.id)
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    user= User.create(name: "kim", email:"kim@gmail.com")
    article = Article.new(content: 'This is the content.', user_id: user.id)
    expect(article).not_to be_valid
  end

  it 'is not valid without content' do
    user= User.create(name: "kim", email:"kim@gmail.com")
    article = Article.new(title: 'Sample Article', user_id: user.id)
    expect(article).not_to be_valid
  end

  it 'is not valid without a user' do
    article = Article.new(title: 'Sample Article', content: 'This is the content.')
    expect(article).not_to be_valid
  end
end


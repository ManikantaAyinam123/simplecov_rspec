# spec/controllers/articles_controller_spec.rb
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user= User.create(name: "kim", email:"kim@gmail.com")
      article = Article.create(title: 'Sample Article', content: 'This is the content.',user_id: user.id)
  
      get :show, params: { id: article.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
  context 'with valid params' do
    it 'creates a new article' do
      user = User.create(name: 'kim', email: 'kim@gmail.com')
      post :create, params: { article: { title: 'New Article', content: 'This is the content.', user_id: user.id } }
     
       expect(response).to have_http_status(:success)

      # Add more expectations if needed, like checking the response body or redirection
    end
  end

  # Add more examples for handling invalid params if needed
end


describe 'PUT #update' do
    it 'updates the article with valid parameters' do
      user = User.create(name: 'kim', email: 'kim@gmail.com')
      article = Article.create(title: 'Old Article', content: 'This is the content.', user_id: user.id)

      put :update, params: { id: article.id, article: { title: 'Updated Article' } }
      article.reload

      expect(article.title).to eq('Updated Article')
      expect(response).to have_http_status(:success)
    end

    it 'returns errors with invalid parameters' do
      user = User.create(name: 'kim', email: 'kim@gmail.com')
      article = Article.create(title: 'Old Article', content: 'This is the content.', user_id: user.id)

      put :update, params: { id: article.id, article: { title: '', content: '' } }
      article.reload

      expect(article.title).to eq('Old Article') # Title should remain unchanged
      expect(article.content).to eq('This is the content.') # Content should remain unchanged
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'DELETE #destroy' do
  it 'destroys the requested article' do
    user = User.create(name: 'John Doe', email: 'john@example.com')
    article = Article.create(title: 'Sample Article', content: 'This is the content.', user_id: user.id)
    
    expect do
      delete :destroy, params: { id: article.id }
    end.to change(Article, :count).by(-1)

    expect(response).to have_http_status(:success)
  end
end


describe 'GET #custom_method' do
it 'returns a success response' do
  get :custom_method
  expect(response).to have_http_status(:success)
end

it 'returns the expected JSON response' do
  get :custom_method
  expect(response.body).to include('Custom method executed successfully')
end
end

end


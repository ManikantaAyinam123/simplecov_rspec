# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(name: 'John Doe', email: 'john@example.com')
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
  context 'with valid params' do
    it 'creates a new user' do
      post :create, params: { user: { name: 'new_user', email: 'new_user@example.com' } }
      expect(response).to have_http_status(:success) # Assuming you expect a success status
      # Add more expectations if needed, like checking the response body or redirection
    end
  end
end
describe 'PUT #update' do
it 'updates the user with valid parameters' do
  user = User.create(name: 'Old Name', email: 'old@example.com')

  put :update, params: { id: user.id, user: { name: 'New Name', email: 'new@example.com' } }
  user.reload

  expect(user.name).to eq('New Name')
  expect(user.email).to eq('new@example.com')
  expect(response).to have_http_status(:success)
end

it 'returns errors with invalid parameters' do
  user = User.create(name: 'Old Name', email: 'old@example.com')

  put :update, params: { id: user.id, user: { name: '', email: 'invalid_email' } }
  user.reload

  expect(user.name).to eq('Old Name') # Name should remain unchanged
  expect(user.email).to eq('old@example.com') # Email should remain unchanged
  expect(response).to have_http_status(:unprocessable_entity)
 
end
end
describe 'DELETE #destroy' do
it 'destroys the requested user' do
  user = User.create(name: 'John Doe', email: 'john@example.com')
  expect do
    delete :destroy, params: { id: user.id }
  end.to change(User, :count).by(-1)

  expect(response).to have_http_status(:success)
end
end
end

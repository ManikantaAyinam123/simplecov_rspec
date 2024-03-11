require 'rails_helper'

RSpec.describe 'Admin Users Form', type: :feature do
  let(:admin_user) { AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') }

  before do
    login_as(admin_user, scope: :admin_user)
    visit new_admin_admin_user_path
  end

  describe 'form' do
    it 'displays the form fields for admin user' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
   
   

    end
  end

  describe 'list of admin users' do
    it 'displays the list of admin users with columns and actions' do
      visit admin_admin_users_path

      expect(page).to have_content('Email')

      expect(page).to have_selector('.actions')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Admin Users', type: :feature do
  let(:admin_user) { AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') }

  before do
    login_as(admin_user, scope: :admin_user)
  end

  describe 'index page' do
    it 'displays the list of admin users with columns and actions' do
      visit admin_admin_users_path

      expect(page).to have_content('Email')
      expect(page).to have_content('Current Sign In At')
      expect(page).to have_content('Sign In Count')
      expect(page).to have_content('Created At')
     
    end
  end

  describe 'new/edit page' do
    it 'displays the form fields for admin user' do
      visit new_admin_admin_user_path

      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_button('Create Admin user')
    end
  end
end

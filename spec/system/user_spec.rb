#bundle exec rspec spec/system/user_spec.rb

require 'rails_helper'
RSpec.describe 'User registration, login and logout functions', type: :system do
  before do
    @user =FactoryBot.create(:user)
  end

  describe 'Testing User Registration' do
    context 'If the user has no data and is not logged in' do
      it 'Testing New User Registration' do
        visit new_user_path
        fill_in 'user[name]', with: 'user2'
        fill_in 'user[email]', with: 'user2@gmail.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_button 'Create my account'
        expect(page).to have_content 'user2'
        expect(page).to have_content 'user2@gmail.com'
      end
      it 'Test to jump to the login screen when you are not logged in' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  
end

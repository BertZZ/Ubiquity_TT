require 'rails_helper'

feature 'Sign Up' do
  scenario 'A user signs up to the service' do
    visit '/'
    click_link 'Register'
    fill_in :user_email, with: 'test@test.com'
    fill_in :user_password, with: 'Potato123!'
    expect { click_button 'Register' }.to change { User.all.count}.by 1
  end
end

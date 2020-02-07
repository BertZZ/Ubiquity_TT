require 'rails_helper'
require 'support/helpers'

feature 'Upload File' do
  scenario 'A user can upload a valid csv' do
    sign_up
    attach_file("file", "#{Rails.root}/test_good.csv")
    click_button 'Upload file'
    click_link 'test_good.csv'
    within('h1') do
      expect(page).to have_content("test_good.csv")
    end
  end
end

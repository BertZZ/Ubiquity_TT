require 'rails_helper'
require 'support/helpers'

feature 'Upload File' do
  scenario 'A user can upload a valid csv' do
    sign_up
    attach_file("file", "#{Rails.root}/test_good.csv", visible: false)
    expect { click_button 'Upload file' }.to change { Upload.all.count}.by 1
  end

  scenario 'A user can not upload an invalid csv' do
    sign_up
    attach_file("file", Rails.root + "test_bad.csv")
    expect { click_button 'Upload file' }.not_to change { Upload.all.count}
    expect(page).to have_content("There was an error with the CSV. Please check the unique identifiers")
  end
end

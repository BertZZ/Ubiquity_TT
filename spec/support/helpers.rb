module Helpers

  def sign_up
    visit '/'
    click_link 'Register'
    fill_in :user_email, with: 'test@test3.com'
    fill_in :user_password, with: 'Potato123!'
    click_button 'Register'
  end

end

RSpec.configure do |config|
  config.include Helpers
end

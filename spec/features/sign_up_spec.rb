require 'rails_helper'

RSpec.describe 'Signing Up', type: feature do
  describe 'The signing up process' do
    let(:user_email) { 'example@email.com' }
    let(:user_password) { '123456' }

    it 'signs the user up' do
      skip
      visit '/'

      expect(page).to have_content 'This is the Tutorial Report Landing Page'

      find(:xpath, "//a[@href='/users/sign_up']").click

      within '.new_user' do
        fill_in 'user_email', with: user_email
        fill_in 'user_password', with: user_password
        fill_in 'user_password_confirmation', with: user_password
        find('[name=commit]').click
      end

      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end

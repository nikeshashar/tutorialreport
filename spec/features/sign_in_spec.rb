require 'rails_helper'

RSpec.describe 'Signing In', type: feature do
  let!(:user) { create(:user, :standard_user) }

  describe 'The signing in process' do
    it 'signs the user in' do
      skip
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        find('[name=commit]').click
      end

      expect(page).to have_content 'Signed in successfully.'
    end
  end
end

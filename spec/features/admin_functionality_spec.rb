require 'rails_helper'

RSpec.describe 'Signing In', type: feature do
  let(:user) { create(:user, :standard_user) }
  let(:admin) { create(:user, :admin) }

  describe 'Sigining in as standard_user' do
    it 'does not display adding tutorial button' do
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        find('[name=commit]').click
      end

      visit '/sub_tutorials'

      expect(page).not_to have_content('Add a tutorial')
    end
  end

  describe 'Sigining in as admin' do
    it 'displays adding tutorial button' do
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password
        find('[name=commit]').click
      end

      visit '/sub_tutorials'

      expect(page).to have_content('Add a tutorial')
    end
  end
end

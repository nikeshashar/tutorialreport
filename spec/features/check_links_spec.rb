require 'rails_helper'

RSpec.describe 'Correct links', type: feature do
  let(:user) { create(:user, :standard_user) }
  let(:admin) { create(:user, :admin) }
  let!(:sub_tutorial) { create(:sub_tutorial) }

  describe 'when at root' do
    it 'shows sub_tutorial link' do
      visit '/'

      find(:xpath, "//a[@href='/sub_tutorials']").click

      expect(page).to have_current_path('/sub_tutorials')
    end
  end

  describe 'when sub_tutorial index as admin' do
    it 'shows add, edit and delete links' do
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password
        find('[name=commit]').click
      end

      visit '/sub_tutorials'
      expect(page).to have_text('Add a tutorial')

      find(:xpath, "//a[@href='/sub_tutorials/#{sub_tutorial.id}']").click

      expect(page).to have_text('Edit this tutorial')
      expect(page).to have_text('Delete this tutorial')
    end
  end

  describe 'when sub_tutorial index as user' do
    it 'doesnt show add, edit and delete links' do
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        find('[name=commit]').click
      end

      visit '/sub_tutorials'
      expect(page).not_to have_text('Add a sub_tutorial')

      find(:xpath, "//a[@href='/sub_tutorials/#{sub_tutorial.id}']").click

      expect(page).not_to have_text('Edit this sub_tutorial')
      expect(page).not_to have_text('Delete this sub_tutorial')
    end
  end
end

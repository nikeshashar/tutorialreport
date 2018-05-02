require 'rails_helper'

RSpec.describe 'Correct links', type: feature do
  # # let(:user) { create(:user, :standard_user) }
  # let(:admin) { create(:user, :admin) }
  let!(:tutorial) { create(:tutorial, id: 1) }
  let!(:second_tutorial) { create(:tutorial, id: 2) }
  let!(:third_tutorial) { create(:tutorial, id: 3) }
  let!(:fourth_tutorial) { create(:tutorial, id: 4) }
  let!(:fifth_tutorial) { create(:tutorial, id: 5) }

  describe 'when at root' do
    it 'shows four tutorials' do
      visit '/'

      expect(page).to have_xpath("//a[@href='/tutorials/1']")
      expect(page).to have_xpath("//a[@href='/tutorials/2']")
      expect(page).to have_xpath("//a[@href='/tutorials/3']")
      expect(page).to have_xpath("//a[@href='/tutorials/4']")
    end
  end

  describe 'when at root' do
    it 'shows tutorial link' do
      visit '/'
      find(:xpath, "//a[@href='/tutorials/1']").click

      expect(page).to have_current_path('/tutorials/1')
    end
  end

  describe 'when tutorial index as admin' do
    it 'shows add, edit and delete links' do
      skip
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: admin.email
        fill_in 'user_password', with: admin.password
        find('[name=commit]').click
      end

      visit '/tutorials'
      expect(page).to have_text('Add a tutorial')

      find(:xpath, "//a[@href='/tutorials/#{tutorial.id}']").click

      expect(page).to have_text('Edit this tutorial')
      expect(page).to have_text('Delete this tutorial')
    end
  end

  describe 'when tutorial index as user' do
    it 'doesnt show add, edit and delete links' do
      skip
      visit '/'

      find(:xpath, "//a[@href='/users/sign_in']").click

      within '.new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        find('[name=commit]').click
      end

      visit '/tutorials'
      expect(page).not_to have_text('Add a tutorial')

      find(:xpath, "//a[@href='/tutorials/#{tutorial.id}']").click

      expect(page).not_to have_text('Edit this tutorial')
      expect(page).not_to have_text('Delete this tutorial')
    end
  end
end

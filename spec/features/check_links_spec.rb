require 'rails_helper'

RSpec.describe 'Correct links', type: feature do
  let(:user) { create(:user, :standard_user) }
  let(:tutorial) { create(:tutorial) }

  describe 'when at root' do
    it 'shows tutorial link' do
      visit '/'

      find(:xpath, "//a[@href='/tutorials']").click

      expect(page).to have_current_path('/tutorials')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Add rating', type: feature do
  let(:tutorial) { create(:tutorial) }
  let(:rating_number) { 10 }

  describe 'Looking at a tutorial page' do
    it 'allows a user to leave a rating' do
      visit "/tutorials/#{tutorial.id}"

      find(:xpath, "//a[@href='/reviews/new']").click

      expect(page).to have_current_path('/reviews/new')

      within '.new_review' do
        fill_in 'review_rating', with: rating_number
        find('[name=commit]').click
      end

      expect(page).to have_current_path("/tutorials/#{tutorial.id}")
      expect(page).to have_content rating_number
    end
  end
end

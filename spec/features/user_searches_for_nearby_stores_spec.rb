require 'rails_helper'

describe "When a user visit '/'" do
  it "they can search for stores near their zip code" do
    VCR.use_cassette("user searches for stores") do
      visit '/'

      fill_in 'zip_code', :with => '80202'
      click_on("Search")

      expect(current_path).to eq('/search')
      expect(page).to have_content("Stores within 25 miles of 80202")
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Long Name:")
      expect(page).to have_content("City:")
      expect(page).to have_content("Distance:")
      expect(page).to have_content("Phone Number:")
      expect(page).to have_content("Store Type:")
    end
  end
end

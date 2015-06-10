require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.


  # before(:all) do
  #   create(:idea)
  #   visit root_path
  #   click_link "Log In"
  # end


  scenario "successfully add a new show" do
    visit '/'
    expect(page).to have_content("TV Shows")
    click_link("Add New Show")
    expect(page).to have_content("Add Show")
    fill_in('Title', with: 'Aviato')
    fill_in('Network', with: 'Showtime')
    fill_in('Starting Year', with: '2014')
    fill_in('Ending Year', with: '2014')
    select('Comedy', from: 'Genre')
    fill_in('Synopsis', with: 'Airplanes that run on water')
    click_on('Add TV Show')
    expect(page).to have_content("TV Shows")
    expect(page).to have_content("Aviato (Showtime)")
    expect(page).to_not have_content('Add Show')
  end
  scenario "fail to add a show with invalid information" do
    visit '/'
    expect(page).to have_content("TV Shows")
    click_link("Add New Show")
    expect(page).to have_content("Add Show")
    fill_in('Title', with: 'Hooli')
    fill_in('Network', with: 'Cinemax')
    fill_in('Starting Year', with: 'First Year')
    fill_in('Ending Year', with: 'Never')
    select('Drama', from: 'Genre')
    fill_in('Synopsis', with: 'Trying to take over the world')
    click_on('Add TV Show')
    expect(page).to_not have_css('.flash')
    expect(page).to have_content('Add Show')
  end

end

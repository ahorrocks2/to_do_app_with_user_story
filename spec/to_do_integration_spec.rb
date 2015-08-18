require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the list path', {:type => :feature}) do
  it('allows the user to see all lists') do
    visit('/')
    click_button('View all lists')
    expect(page).to have_content('View All Lists')
  end

  it('allow the user to add a new list') do
    visit('/')
    click_button('Add a list')
    expect(page).to have_content('New List:')
  end

end

feature 'Search' do

  scenario 'When User Enter ' do
    visit search_index_path
    expect(page).to have_content 'Welcome to ImageSearch'
  end

end
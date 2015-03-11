module UserMacros

  def sign_in_action(user)
    visit root_path
    click_link 'sign in'
    fill_in 'user_login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def add_place_to_visited(place)
    visit places_path
    click_link 'Show'
    expect(current_path).to eq place_path(place)
    click_link 'Add to visited', place
    expect(current_path).to eq place_path(place)
  end
end

feature 'user signup' do
  scenario 'user can access sign up form' do
    visit '/'
    click_on('Sign Up')
    expect(page).to have_content('Name')
    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'user completes sign up' do
    before = User.all.length
    sign_up_user
    expect(User.all.length).to eq before + 1
  end

  scenario 'user cannot sign up if username already in use' do
    sign_up_user
    click_on('Sign Up') 
    fill_in 'name', with: 'Gram Parsons'
    fill_in 'username', with: 'flyingBurrito'
    fill_in 'email', with: 'grampy@gmail.com'
    fill_in 'password', with: 'Emmylou123'
    expect { click_on('Sign Me Up!') }.to change { User.all.length }.by(0)
  end
end

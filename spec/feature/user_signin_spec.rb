feature 'user sign in' do
  context 'before signing in' do
    scenario 'user can access sign in form' do
      visit '/'
      click_on('Sign In')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    scenario 'user can sign in' do
      sign_up_user
      visit '/'
      click_on('Sign In')
      fill_in 'email', with: 'cecil3@gmail.com'
      fill_in 'password', with: 'Emmylou123'
      click_on('Sign Me In!') 
      expect(page).to have_content('Gram Parsons')
    end

    scenario 'user gives incorrect email' do
      visit '/'
      click_on 'Sign In'
      fill_in 'email', with: 'lizzzy@hey.com'
      fill_in 'password', with: 'Password123'
      click_on('Sign Me In!') 
      expect(page).not_to have_content("You're seeing this error because you have enabled the show_exceptions setting")
    end
  end
end

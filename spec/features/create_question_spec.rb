require 'rails_helper'

RSpec.describe 'Create new question' do
  scenario 'User creates new question' do
    visit root_path

    click_link 'Log in'
    click_link 'Sign up'

    click_button 'Sign up'

    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'

    click_button 'Sign up'

    click_link 'Dodaj pytanie'

    expect(page).to have_content 'Title'
    expect(page).to have_content 'Content'
    expect(page).to have_content 'Tags'
    expect(current_path).not_to eq root_path

    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Lorem ipsum test content'
    fill_in 'Tags', with: 'pierwszy, drugi, pierwszy, trzeci'

    click_button 'Dodaj pytanie'

    expect(current_path).to eq question_path(Question.last)
    expect(page).to have_content 'Question was successfully created.'
  end
end
# Frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'User visits the homepage' do
    visit root_path
    expect(page).to have_content('Happy Bidding!')
    expect(page).to have_link('Join the Bidding Frenzy!', href: '/login')
  end

  scenario 'User clicks the button and the modal appears' do
    visit root_path
    click_link 'Join the Bidding Frenzy!'
  end
end

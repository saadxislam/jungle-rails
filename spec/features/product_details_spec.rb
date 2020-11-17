require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    
  end

  scenario "They see the product details" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    first("article.product").find_link('Details').click
    expect(page).to have_css '.products-show'
  end
end
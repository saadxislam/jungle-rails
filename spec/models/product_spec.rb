require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves successfully" do 
      @product = Product.new

      @product.name = 'hi'
      @product.price = 1
      @product.quantity = 1
      @product.category_id = 1

      @product.save

      expect(@product).to be_present
    end

    it "validates name" do 
      @product = Product.new

      @product.name = nil
      @product.price = 1
      @product.quantity = 1
      @product.category_id = 1

      @product.save

      # puts @product.errors.full_messages.inspect

      expect(@product.errors.full_messages).to include("Name can't be blank")
  
    end

    it "validates price" do 
      @product = Product.new

      @product.name = 'hi'
      @product.price = nil
      @product.quantity = 1
      @product.category_id = 1

      @product.save

      # puts @product.errors.full_messages.inspect

      expect(@product.errors.full_messages).to include("Price can't be blank")
  
    end

    it "validates quantity" do 
      @product = Product.new

      @product.name = 'hi'
      @product.price = 1
      @product.quantity = nil
      @product.category_id = 1

      @product.save

      # puts @product.errors.full_messages.inspect

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates category" do 
      @product = Product.new

      @product.name = 'hi'
      @product.price = 1
      @product.quantity = 1
      @product.category_id = nil

      @product.save

      # puts @product.errors.full_messages.inspect

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

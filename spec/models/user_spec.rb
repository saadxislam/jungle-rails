require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates password" do 
      @user = User.new

      @user.password = 'hi'
      @user.password_confirmation = 'hello'

      @user.save

      puts @user.errors.full_messages.inspect

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "validates password" do 
      @user = User.new

      @user.password = nil
      @user.password_digest = nil

      @user.save

      puts @user.errors.full_messages.inspect

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    context "email validations " do 
      @user1 = User.new(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: '123', password_digest: '123')

      @user1.save

      it 'validates email uniqueness' do
        @email = 'test@test.com'

        @user2 = User.new(first_name: 'Jane', last_name: 'Doe', email: @email, password: '123', password_digest: '123')

        puts @user2.errors.full_messages

        expect(@user2).to_not be_valid
      end

    it "validates case sensitivity isn't an issue" do 
      @email = 'test@test.com'

      @user2 = User.new(first_name: 'Jane', last_name: 'Doe', email: 'test@test.COM', password: '123', password_digest: '123')

      # puts @user2.errors.full_messages

      expect(@user2).to_not be_valid
    end

  end

  it "validates first name is required" do 

    @user2 = User.new(last_name: 'Doe', email: 'test@test.COM', password: '123', password_digest: '123')

    puts @user2.errors.full_messages

    expect(@user2).to_not be_valid
  end

  it "validates password length" do 

    @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'test1@test.com', password: '1', password_confirmation: '1')
    @user.save

      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('tom@email.com', 'password')
      expect(new_user).to eq(actual_user)


    expect(@user).to_not be_valid
  end
end

  describe '.authenticate_with_credentials' do

    it 'returns the user' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('tom@email.com', 'password')
      expect(new_user).to eq(actual_user)
    end

    it 'returns the nil' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'test3@test.com', password: '123', password_confirmation: '123')
      @user.save
      @invaliduser = User.authenticate_with_credentials('test3@test.com', '132')
     expect(@invaliduser).to eq nil
    end

    it 'should authenticate if user adds uppercase letters to their email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials('EMAIL@email.com', 'apples')
      expect(valid_user).to eq(user)
    end

    it 'should authenticate if user adds spaces to beginning or end of email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials(' email@email.com ', 'apples')
      expect(valid_user).to eq(user)
    end
  end

end



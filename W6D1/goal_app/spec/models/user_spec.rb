require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do      
  subject(:user) { User.create!(username: 'Kevin', password: 'hunter2') } 

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  it { should have_many(:goals) }
  it { should have_many(:comments) }
  
  describe "session token handling" do 
    it 'is able to generate a random session token, which is a String' do   
      user = User.create!(username: 'Adam', password: 'hunter2')
      
      expect(user.session_token).to be_a(String)
    end
    
    it 'is able to reset a session token' do
      user = User.create!(username: 'Bob', password: 'hunter2')
      token2 = user.reset_session_token!
      expect(user.session_token).to eq(token2)
    end

    it 'ensures that each user has a session token' do 
      user = User.create!(username: 'Jim', password: 'hunter2')
      expect(user.session_token).not_to be(nil)
    end
  end

  describe "password handling" do 
    it 'does not save password to database' do
        User.create!(username: 'John', password: 'hunter2')
        user = User.find_by( username: 'John' )
        expect(user.password).not_to be('hunter2')
    end 

    it 'should call BCrypt to encrypt the password' do    
      expect(BCrypt::Password).to receive(:create) 
      User.new(username: 'Todd', password: 'hunter2')
    end

    it 'can detect when given password is right or wrong' do 
      user = User.create!(username: 'Bill', password: 'hunter2')
      expect(user.is_password?('hunter1')).to be(false)
      expect(user.is_password?('hunter2')).to be(true)
    end
  end

  describe "find_by_credentials" do 
    it 'should return the user if the user exists' do
      user = User.create!(username: 'Ted', password: 'hunter2')
      expect(User.find_by_credentials('Ted', 'hunter2')).to eq(user)
    end

    it 'should return nil if the user cannot be found' do 
      expect(User.find_by_credentials('Spaghetti', 'password1')).to be(nil)
    end
  end
end

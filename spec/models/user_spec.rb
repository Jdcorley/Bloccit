require 'rails_helper'

RSpec.describe User, type: :model do
 # Create user
 let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
 
 # Should tests for name
 it { should validate_presence_of(:name) }
 it { should validate_length_of(:name).is_at_least(1) }

 # Should tests for email
 it { should validate_presence_of(:email) }
 it { should validate_uniqueness_of(:email) } 
 it { should validate_length_of(:email).is_at_least(3) }
 it { should allow_value("user@bloccit.com").for(:email) }
 
 # Should tests for password
 it { should validate_presence_of(:password) }
 it { should have_secure_password }
 it { should validate_length_of(:password).is_at_least(6) }
 
 # Describe attributes of valid user "true valid"
 describe "attributes" do 
  it "should have name and email attributes" do 
   expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
  end

  it "capitalize user's name" do 
   user.name = "jack corley"
   user.save 
   expect(user.name).to eq "Jack Corley" 
  end 
end 

 # Describe invalid user "true negative"
 describe "invalid user" do 
  let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
  let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

   it "should be an invalid due to blank name" do 
    expect(user_with_invalid_name).to_not be_valid
   end
 
   it "should be an invalid user due to blank email" do 
    expect(user_with_invalid_email).to_not be_valid
   end
 
 end 
end

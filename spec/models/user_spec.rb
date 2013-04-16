require 'spec_helper'

describe User do

  before { @user = User.new(:username => 'exampleuser',
                            :email => 'user@example.com',
                            :password => 'password') }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = 'a' * 25 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not in proper format" do
    before { @user.email = "invalidemail@" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "pass" }
    it { should_not be_valid }
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   
   def setup
    @user = User.new(username: 'TestUser', password: 'Example12!', password_confirmation: 'Example12!')
  end
  
    test "should be vaild" do
      	assert @user.valid?
    end
    
    test "username should be present" do
      @user.username = "      "
      assert_not @user.valid?
    end
      
    test "username not contain" do
    @user.username = "@!#$coolbeans"
    assert_not @user.valid?
    end
    
    test "username not to short " do
      @user.username = "x" * 1
      assert_not @user.valid?
    end
    
    test "username not to long" do
      @user.username = "x" * 16
      assert_not @user.valid?
    end
      
    test "username should be unique" do
      duplicate_user = @user.dup
      duplicate_user.username = @user.username.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
      
    test "password should be present" do
      @user.password = " " * 10
      assert_not @user.valid?
    end
    
    test "password not to short" do
    @user.password = @user.password_confirmation = "a" * 9
    assert_not @user.valid?
   end
  
    test "password  must contain" do
      @user.password = @user.password_confirmation = "abcdABCD1234!@#$%" 
      assert @user.valid?
    end
end

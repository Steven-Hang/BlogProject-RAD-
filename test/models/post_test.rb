require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
    def setup
    @user = users(:Kimmy)
    @post = Post.new(title: 'TestTitle10', source: 'https://www.example.com', user_id: @user.id)
    end
  
   test "should be vaild" do
      	assert @post.valid?
    end
    
    test "should be at least 10" do
      @post.title = "x" * 11 
      assert @post.valid?
    end
    
    test "should not be blank" do
      @post.title = " " * 11
      assert_not @post.valid?
    end
  
    test "should not be over 200" do
      @post.title = "x" * 201
        assert_not @post.valid?
      end
  
end
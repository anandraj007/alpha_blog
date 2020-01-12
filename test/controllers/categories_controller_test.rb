require 'test_helper'

class CategoriesControllerTest <  ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "sports")
        @user = User.create(username:"anand",email:"anand@gmail.com",password:"password",admin:true)
    end
    
    test "should have index of category" do
        get categories_path
        assert_response :success
    end

    test "should have new category" do
        sign_in_as_admin(@user)
        get new_category_path
        assert_response :success
    end

    test "should have show path of category" do
        get category_path(@category)
        assert_response :success
    end

    test"should redirect if user is not log in as admin" do
        assert_no_difference "Category.count" do
          post categories_path,params:{category:{name:"sport"}}
        end
        assert_redirected_to categories_path
    end

    def sign_in_as_admin(user)
        post login_path,params:{session:{email:user.email,password:user.password}}
    end
end
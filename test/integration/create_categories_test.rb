require 'test_helper'
def setup
    @category = Category.create(name: "sport")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
end

class CreateCategoriesTest  < ActionDispatch::IntegrationTest
    test "get new category form and create category" do
        sign_in_as(@user,"password")
        get new_category_path
        assert_equal 200, status

        assert_template 'categories/new'
        assert_difference "Category.count", 1 do
          post categories_path,params: {category: {name: "sport"}}
          follow_redirect!
        end
        assert_template 'categories/index'
    end

    test "validate new category form submission" do
        sign_in_as(@user,"password")
        get new_category_path
        assert_equal 200, status

        assert_template 'categories/new'
        assert_no_difference "Category.count" do
          post categories_path,params: {category: {name: ""}}
        end
        assert_template 'categories/new'
        assert_select 'div.card-title'
        assert_select 'li.card-text'
    end

end
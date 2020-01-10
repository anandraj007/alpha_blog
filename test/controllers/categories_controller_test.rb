require 'test_helper'

class CategoriesControllerTest <  ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "sports")
    end
    

    test "should have index of category" do
        get categories_path
        assert_response :success
    end

    test "should have new category" do
        get new_category_path
        assert_response :success
    end

    test "should have show path of category" do
        get category_path(@category)
        assert_response :success
    end
end
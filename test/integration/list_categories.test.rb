require 'test_helper'

class ListCategoriesTest <  ActionDispatch::IntegrationTest

    def setup
        @category1 = Category.create(name:"news")
        @category2 = Category.create(name:"travel")
    end
    
    test "should list all categories" do
        get categories_path
        assert_equal 200,status

        assert_template 'categories/index'
        assert_select 'a[href=?]',category_path(@category1), text: @category1.name
        assert_select 'a[href=?]',category_path(@category2), text: @category2.name
    end
    
end
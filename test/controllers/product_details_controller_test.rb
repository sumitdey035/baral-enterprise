require 'test_helper'

class ProductDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_detail = product_details(:one)
  end

  test "should get index" do
    get product_details_url
    assert_response :success
  end

  test "should get new" do
    get new_product_detail_url
    assert_response :success
  end

  test "should create product_detail" do
    assert_difference('ProductDetail.count') do
      post product_details_url, params: { product_detail: { bill_date: @product_detail.bill_date, bill_no: @product_detail.bill_no, category: @product_detail.category, model_code: @product_detail.model_code, model_name: @product_detail.model_name, purchased_from: @product_detail.purchased_from, quantity: @product_detail.quantity, serial_no: @product_detail.serial_no, sub_category: @product_detail.sub_category, warranty: @product_detail.warranty } }
    end

    assert_redirected_to product_detail_url(ProductDetail.last)
  end

  test "should show product_detail" do
    get product_detail_url(@product_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_detail_url(@product_detail)
    assert_response :success
  end

  test "should update product_detail" do
    patch product_detail_url(@product_detail), params: { product_detail: { bill_date: @product_detail.bill_date, bill_no: @product_detail.bill_no, category: @product_detail.category, model_code: @product_detail.model_code, model_name: @product_detail.model_name, purchased_from: @product_detail.purchased_from, quantity: @product_detail.quantity, serial_no: @product_detail.serial_no, sub_category: @product_detail.sub_category, warranty: @product_detail.warranty } }
    assert_redirected_to product_detail_url(@product_detail)
  end

  test "should destroy product_detail" do
    assert_difference('ProductDetail.count', -1) do
      delete product_detail_url(@product_detail)
    end

    assert_redirected_to product_details_url
  end
end

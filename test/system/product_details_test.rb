require "application_system_test_case"

class ProductDetailsTest < ApplicationSystemTestCase
  setup do
    @product_detail = product_details(:one)
  end

  test "visiting the index" do
    visit product_details_url
    assert_selector "h1", text: "Product Details"
  end

  test "creating a Product detail" do
    visit product_details_url
    click_on "New Product Detail"

    fill_in "Bill date", with: @product_detail.bill_date
    fill_in "Bill no", with: @product_detail.bill_no
    fill_in "Category", with: @product_detail.category
    fill_in "Model code", with: @product_detail.model_code
    fill_in "Model name", with: @product_detail.model_name
    fill_in "Purchased from", with: @product_detail.purchased_from
    fill_in "Quantity", with: @product_detail.quantity
    fill_in "Serial no", with: @product_detail.serial_no
    fill_in "Sub category", with: @product_detail.sub_category
    check "Warranty" if @product_detail.warranty
    click_on "Create Product detail"

    assert_text "Product detail was successfully created"
    click_on "Back"
  end

  test "updating a Product detail" do
    visit product_details_url
    click_on "Edit", match: :first

    fill_in "Bill date", with: @product_detail.bill_date
    fill_in "Bill no", with: @product_detail.bill_no
    fill_in "Category", with: @product_detail.category
    fill_in "Model code", with: @product_detail.model_code
    fill_in "Model name", with: @product_detail.model_name
    fill_in "Purchased from", with: @product_detail.purchased_from
    fill_in "Quantity", with: @product_detail.quantity
    fill_in "Serial no", with: @product_detail.serial_no
    fill_in "Sub category", with: @product_detail.sub_category
    check "Warranty" if @product_detail.warranty
    click_on "Update Product detail"

    assert_text "Product detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Product detail" do
    visit product_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product detail was successfully destroyed"
  end
end

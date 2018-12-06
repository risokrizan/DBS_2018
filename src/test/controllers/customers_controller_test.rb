require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer_pc" do
    assert_difference('Customer.count') do
      post customers_url, params: {customer_pc: {birth_date: @customer.birth_date, city: @customer.city, first_name: @customer.first_name, id_card_number: @customer.id_card_number, last_name: @customer.last_name, street: @customer.street, zip: @customer.zip } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer_pc" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer_pc" do
    patch customer_url(@customer), params: {customer_pc: {birth_date: @customer.birth_date, city: @customer.city, first_name: @customer.first_name, id_card_number: @customer.id_card_number, last_name: @customer.last_name, street: @customer.street, zip: @customer.zip } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer_pc" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end

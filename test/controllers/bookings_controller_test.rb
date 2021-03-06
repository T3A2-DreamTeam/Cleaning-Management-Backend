require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url, headers: { Authorization: "Bearer " + "TEST" }, as: :json
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url,
           params: { body: @booking.body, email: @booking.email, first_name: @booking.first_name, last_name: @booking.last_name, phone_number: @booking.phone_number, service_type_id: @booking.service_type_id }, as: :json
    end

    assert_response 201
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking), headers: { Authorization: "Bearer " + "TEST" }, as: :json
    end

    assert_response 204
  end
end

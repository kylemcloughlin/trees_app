require 'test_helper'

class DiametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diameter = diameters(:one)
  end

  test "should get index" do
    get diameters_url, as: :json
    assert_response :success
  end

  test "should create diameter" do
    assert_difference('Diameter.count') do
      post diameters_url, params: { diameter: { dbh_trunk: @diameter.dbh_trunk } }, as: :json
    end

    assert_response 201
  end

  test "should show diameter" do
    get diameter_url(@diameter), as: :json
    assert_response :success
  end

  test "should update diameter" do
    patch diameter_url(@diameter), params: { diameter: { dbh_trunk: @diameter.dbh_trunk } }, as: :json
    assert_response 200
  end

  test "should destroy diameter" do
    assert_difference('Diameter.count', -1) do
      delete diameter_url(@diameter), as: :json
    end

    assert_response 204
  end
end

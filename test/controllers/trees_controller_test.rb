require 'test_helper'

class TreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tree = trees(:one)
  end

  test "should get index" do
    get trees_url, as: :json
    assert_response :success
  end

  test "should create tree" do
    assert_difference('Tree.count') do
      post trees_url, params: { tree: { address: @tree.address, botanical_name: @tree.botanical_name, common_name: @tree.common_name, dbh_trunk: @tree.dbh_trunk, diameter_id: @tree.diameter_id, lat: @tree.lat, location_id: @tree.location_id, long: @tree.long, name: @tree.name, tree_posit: @tree.tree_posit, type_id: @tree.type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show tree" do
    get tree_url(@tree), as: :json
    assert_response :success
  end

  test "should update tree" do
    patch tree_url(@tree), params: { tree: { address: @tree.address, botanical_name: @tree.botanical_name, common_name: @tree.common_name, dbh_trunk: @tree.dbh_trunk, diameter_id: @tree.diameter_id, lat: @tree.lat, location_id: @tree.location_id, long: @tree.long, name: @tree.name, tree_posit: @tree.tree_posit, type_id: @tree.type_id } }, as: :json
    assert_response 200
  end

  test "should destroy tree" do
    assert_difference('Tree.count', -1) do
      delete tree_url(@tree), as: :json
    end

    assert_response 204
  end
end

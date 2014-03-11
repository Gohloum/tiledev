require 'test_helper'

class M3LevelsControllerTest < ActionController::TestCase
  setup do
    @m3_level = m3_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m3_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m3_level" do
    assert_difference('M3Level.count') do
      post :create, m3_level: { active: @m3_level.active, data: @m3_level.data, icons: @m3_level.icons, name: @m3_level.name, order: @m3_level.order }
    end

    assert_redirected_to m3_level_path(assigns(:m3_level))
  end

  test "should show m3_level" do
    get :show, id: @m3_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m3_level
    assert_response :success
  end

  test "should update m3_level" do
    patch :update, id: @m3_level, m3_level: { active: @m3_level.active, data: @m3_level.data, icons: @m3_level.icons, name: @m3_level.name, order: @m3_level.order }
    assert_redirected_to m3_level_path(assigns(:m3_level))
  end

  test "should destroy m3_level" do
    assert_difference('M3Level.count', -1) do
      delete :destroy, id: @m3_level
    end

    assert_redirected_to m3_levels_path
  end
end

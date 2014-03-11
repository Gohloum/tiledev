require 'test_helper'

class M3BoardsControllerTest < ActionController::TestCase
  setup do
    @m3_board = m3_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m3_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m3_board" do
    assert_difference('M3Board.count') do
      post :create, m3_board: { data: @m3_board.data, name: @m3_board.name }
    end

    assert_redirected_to m3_board_path(assigns(:m3_board))
  end

  test "should show m3_board" do
    get :show, id: @m3_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m3_board
    assert_response :success
  end

  test "should update m3_board" do
    patch :update, id: @m3_board, m3_board: { data: @m3_board.data, name: @m3_board.name }
    assert_redirected_to m3_board_path(assigns(:m3_board))
  end

  test "should destroy m3_board" do
    assert_difference('M3Board.count', -1) do
      delete :destroy, id: @m3_board
    end

    assert_redirected_to m3_boards_path
  end
end

require 'test_helper'

class LeaderBoardsControllerTest < ActionController::TestCase
  setup do
    @leader_board = leader_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leader_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leader_board" do
    assert_difference('LeaderBoard.count') do
      post :create, leader_board: { date: @leader_board.date, description: @leader_board.description, game: @leader_board.game }
    end

    assert_redirected_to leader_board_path(assigns(:leader_board))
  end

  test "should show leader_board" do
    get :show, id: @leader_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leader_board
    assert_response :success
  end

  test "should update leader_board" do
    put :update, id: @leader_board, leader_board: { date: @leader_board.date, description: @leader_board.description, game: @leader_board.game }
    assert_redirected_to leader_board_path(assigns(:leader_board))
  end

  test "should destroy leader_board" do
    assert_difference('LeaderBoard.count', -1) do
      delete :destroy, id: @leader_board
    end

    assert_redirected_to leader_boards_path
  end
end

class FanLeaderBoardsController < ApplicationController
  def index
    @fan = Fan.find(params[:fan_id])
    @leader_boards = LeaderBoard.all
    puts @leader_boards.inspect
  end
  
  def update_multiple
    @fan = Fan.find(params[:fan_id])
    @leader_boards = LeaderBoard.all
    Fan.transaction do
      @leader_boards.each do |leader_board|
        if params[:leader_boards][leader_board.id.to_s]['followed'] == 'true'
          @fan.follow!(leader_board)
        else
          @fan.unfollow!(leader_board)
        end
      end
    end
    redirect_to :action => :index, :fan_id => @fan.id
  end
end
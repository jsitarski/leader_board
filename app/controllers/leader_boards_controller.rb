class LeaderBoardsController < ApplicationController
  # GET /leader_boards
  # GET /leader_boards.json
  def index
    @leader_boards = LeaderBoard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leader_boards }
    end
  end

  # GET /leader_boards/1
  # GET /leader_boards/1.json
  def show
    @leader_board = LeaderBoard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leader_board }
    end
  end

  # GET /leader_boards/new
  # GET /leader_boards/new.json
  def new
    @leader_board = LeaderBoard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leader_board }
    end
  end

  # GET /leader_boards/1/edit
  def edit
    @leader_board = LeaderBoard.find(params[:id])
  end

  # POST /leader_boards
  # POST /leader_boards.json
  def create
    @leader_board = LeaderBoard.new(params[:leader_board])

    respond_to do |format|
      if @leader_board.save
        format.html { redirect_to @leader_board, notice: 'Leader board was successfully created.' }
        format.json { render json: @leader_board, status: :created, location: @leader_board }
      else
        format.html { render action: "new" }
        format.json { render json: @leader_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leader_boards/1
  # PUT /leader_boards/1.json
  def update
    @leader_board = LeaderBoard.find(params[:id])

    respond_to do |format|
      if @leader_board.update_attributes(params[:leader_board])
        format.html { redirect_to @leader_board, notice: 'Leader board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leader_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leader_boards/1
  # DELETE /leader_boards/1.json
  def destroy
    @leader_board = LeaderBoard.find(params[:id])
    @leader_board.destroy

    respond_to do |format|
      format.html { redirect_to leader_boards_url }
      format.json { head :no_content }
    end
  end
end

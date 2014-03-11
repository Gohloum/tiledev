class M3BoardsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #before_action :set_m3_board, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :xml

  def get_data
    request.format = 'xml'
    @data = M3Board.find(params[:id]).data
    respond_with(@data)
  end

  def update_data
    request.format = 'xml'
    @board = M3Board.find(params[:id])
    respond_to do |format|
      if @board.update(data: params[:data])
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  def success
    request.format = 'xml'
    respond_with(@board)
  end

  def error
    request.format = 'xml'
    respond_with(@board)
  end

  # DELETE /m3_boards/1
  # DELETE /m3_boards/1.json
  def destroy
    @m3_board.destroy
    respond_to do |format|
      format.html { redirect_to m3_boards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m3_board
      @m3_board = M3Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def m3_board_params
      params.require(:m3_board).permit(:name, :data)
    end
end

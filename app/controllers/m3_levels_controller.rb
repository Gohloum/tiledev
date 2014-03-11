class M3LevelsController < ApplicationController
  #before_action :set_m3_level, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  before_action :get_project_by_id, only: [:create, :copy, :get_levels_by_project_id, :update]
  respond_to :html, :json, :xml

  def success
    request.format = 'xml'
   # @m3_level = M3Level.find(@m3_level.id)
    respond_with(@m3_level)
  end

  def error
    request.format = 'xml'
    respond_with(@data)
  end

  def get_levels_by_project_id
    request.format = 'xml'
    @m3_levels = @project.m3_levels.where(active: 1).order(:order)
    respond_with(@m3_levels)
  end

  def get_level_by_id
    request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    @data = @m3_level.data
    respond_with(@data)
  end

  # POST /m3_levels
  # POST /m3_levels.json
  def create
    @m3_board = M3Board.new(name: params[:name], data: params[:boardData])
    if @m3_board.save
      @m3_level = M3Level.new(name: params[:name], data: params[:data], active: 1, order: params[:order], icons: params[:icons], m3_board_id: @m3_board.id)
      request.format = 'xml'
      respond_to do |format|
        if @m3_level.save
          # set association between project and level
          @project.m3_levels << @m3_level
          format.xml {render action: 'success', :content_type => 'application/xml'}
        else
          @data = @m3_level.errors
          format.xml {render action: 'error', :content_type => 'application/xml'}
        end
      end
    else
      @data = @m3_board.errors
      format.xml {render action: 'error', :content_type => 'application/xml'}
    end
  end

  def copy
    @level = M3Level.find(params[:id])
    @board = M3Board.find(@level.m3_board_id)
    @name = params[:name]
    @m3_board = M3Board.new(name: @name, data: @board.data)
    if @m3_board.save
      @m3_level = M3Level.new(name: @name, data: @level.data, active: @level.active, order: @level.order, m3_board_id: @level.m3_board_id)
      request.format = 'xml'
      respond_to do |format|
        if @m3_level.save
          @project.m3_levels << @m3_level
          format.xml {render action: 'success', :content_type => 'application/xml'}
        else
          @data = @m3_level.errors
          format.xml {render action: 'error', :content_type => 'application/xml'}
        end
      end
    end
  end

  # PATCH/PUT /m3_levels/1
  # PATCH/PUT /m3_levels/1.json
  def update
    respond_to do |format|
      if @m3_level.update(m3_level_params)
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        @data = @m3_board.errors
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  def update_name
    request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    @m3_board = M3Board.find(@m3_level.m3_board_id)
    respond_to do |format|
      if @m3_level.update(name: params[:name])
         @m3_board.update(name: params[:name])
         format.xml {render action: 'success', :content_type => 'application/xml'}
       else
         @data = @m3_board.errors
         format.xml {render action: 'error', :content_type => 'application/xml'}
       end
    end

  end

  def update_data
    request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    respond_to do |format|
      if @m3_level.update(data: params[:data])
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        @data = @m3_board.errors
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end

  end

  def update_order
    # First we need to convert the params coming over from flash client using
    # JSON.stringify(obj). Orderlist points at an array of objects that
    # were converted to escaped string.
    @list = JSON.parse(params["orderList"])

    # Now we have an array of JSON objects.  Note the keys must be accessed
    # through strings.  :symbols will not work.
    @list.each do |item|
      M3Level.find(item["id"]).update(order: item["order"])
    end

    @data = '<success />'
    #request.format = 'xml'
    respond_with(@data)

    #@m3_level = M3Level.update(params[:id], params[:order])
    #respond_to do |format|
    #  if @m3_level.save
    #    format.xml {render action: 'success', :content_type => 'application/xml'}
    #  else
    #    @data = @m3_board.errors
    #    format.xml {render action: 'error', :content_type => 'application/xml'}
    #  end
    #end

  end

  def update_icons
    request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    respond_to do |format|
      if @m3_level.update(params[:icons])
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        @data = @m3_board.errors
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  # DELETE /m3_levels/1
  # DELETE /m3_levels/1.json
  def destroy
    request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    @m3_board = M3Board.find(@m3_level.m3_board_id)
    @m3_level.destroy
    @m3_board.destroy
    @data = '<success status="ok">'
    respond_with(@data)
  end

  def update_active
    #request.format = 'xml'
    @m3_level = M3Level.find(params[:id])
    respond_to do |format|
      if @m3_level.update(active: params[:active])
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        @data = @m3_board.errors
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  private
    def get_project_by_id
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_m3_level
      @m3_level = M3Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def m3_level_params
      params.require(:m3_level).permit(:name, :data, :active, :order, :icons, :project_id)
    end
end

class ProjectsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :get_game_type, only: [:index, :edit, :update, :destroy]
  before_action only: [:show, :edit, :update, :destroy] do
    :set_project
  end

  respond_to :html, :json, :xml

  # GET /projects
  # GET /projects.json
  def index
    request.format = 'xml'
    @projects = @game_type.projects.all
    respond_with(@projects)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @m3_levels = @project.m3_levels.where(active: 1)

    data = "<data>"
    globals = "<globals>"
    levels = "<levels>"
    boards = "<boards>"

    @m3_levels.each do |level|
      levels += level.data
      boards += level.m3_board.data
    end

    globals += "</globals>"
    levels += "</levels>"
    boards += "</boards>"

    data += globals + levels + boards + "</data>"

    @app_data = data

    respond_with(@app_data)
  end

  def success
    respond_with(@project)
  end

  def error
    respond_with(@project)
  end

  # Need to look up handling a rails param hash coming from a POST request
  def create
    @project = Project.new(name: params[:name], game_type_id: params[:game_type_id])

    request.format = 'xml'
    respond_to do |format|
      if @project.save
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    request.format = 'xml'
    respond_to do |format|
      if @project.update(id: params[:id], name: params[:name])
        format.xml {render action: 'success', :content_type => 'application/xml'}
      else
        format.xml {render action: 'error', :content_type => 'application/xml'}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = @game_type.projects.find(params[:id])
  end

  def get_game_type
    @game_type = GameType.find(params[:game_type_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    #params.require(:project).permit(:id, :name, :data, :game_type_id)
    #params[:id, :name, :game_type_id]
  end
end

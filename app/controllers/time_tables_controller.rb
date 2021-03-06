class TimeTablesController < ApplicationController
  before_action :set_time_table, only: [:show, :edit, :update, :destroy]
  before_action :set_subjects, only: [:show, :edit]

  # GET /time_tables
  # GET /time_tables.json
  def index
    @time_tables = TimeTable.all
  end

  # GET /time_tables/1
  # GET /time_tables/1.json
  def show
  end

  # GET /time_tables/new
  def new
    @time_table = TimeTable.new
  end

  # GET /time_tables/1/edit
  def edit
  end

  # POST /time_tables
  # POST /time_tables.json
  def create
    @time_table = TimeTable.new(time_table_params)

    respond_to do |format|
      if @time_table.save
        Subject.where(compulsory: true).each do |subject|
          @time_table.timetable_subjects.create(subject_id: subject.id)
        end
        
        format.html { redirect_to @time_table, notice: 'Time table was successfully created.' }
        format.json { render :show, status: :created, location: @time_table }
      else
        format.html { render :new }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_tables/1
  # PATCH/PUT /time_tables/1.json
  def update
    respond_to do |format|
      if @time_table.update(time_table_params)
        format.html { redirect_to @time_table, notice: 'Time table was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_table }
      else
        format.html { render :edit }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tables/1
  # DELETE /time_tables/1.json
  def destroy
    @time_table.destroy
    respond_to do |format|
      format.html { redirect_to time_tables_url, notice: 'Time table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_table
      @time_table = TimeTable.find(params[:id])
    end

    def set_subjects
      # Index of selected subjects
      @selected_subjects = Subject.selected(@time_table.id)
      selected_ids = @selected_subjects.pluck(:id)
      # Index of available subjects
      @subjects = Subject.where.not(id: selected_ids)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_table_params
      params.fetch(:time_table).permit(:name, :complete)
    end
end

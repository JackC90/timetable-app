class TimetableSubjectsController < ApplicationController
  before_action :set_timetable_subject, only: [:show, :edit, :update, :destroy]

  # GET /timetable_subjects
  # GET /timetable_subjects.json
  def index
    @timetable_subjects = TimetableSubject.all
  end

  # GET /timetable_subjects/1
  # GET /timetable_subjects/1.json
  def show
  end

  # GET /timetable_subjects/new
  def new
    @timetable_subject = TimetableSubject.new
  end

  # GET /timetable_subjects/1/edit
  def edit
  end

  # POST /timetable_subjects
  # POST /timetable_subjects.json
  def create
    @time_table = TimeTable.find(params[:time_table_id])
    @timetable_subject = @time_table.timetable_subjects.new(timetable_subject_params)

    respond_to do |format|
      if @timetable_subject.save
        format.html { redirect_to :back, notice: 'Subject was successfully added to timetable.' }
        format.json { render :show, status: :created, location: @timetable_subject }
        format.js
      else
        format.html { redirect_to :back, notice: "Slot has been taken!" }
        format.json { render json: @timetable_subject.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /timetable_subjects/1
  # DELETE /timetable_subjects/1.json
  def destroy
    @timetable_subject.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Timetable subject was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable_subject
      @timetable_subject = TimetableSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_subject_params
      params.require(:timetable_subject).permit(:subject_id)
    end
end

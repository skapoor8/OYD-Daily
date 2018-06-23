class MltAttendancesController < ApplicationController
  before_action :set_mlt_attendance, only: [:show, :edit, :update, :destroy]

  # GET /mlt_attendances
  # GET /mlt_attendances.json
  def index
    @mlt_attendances = MltAttendance.all
  end

  # GET /mlt_attendances/1
  # GET /mlt_attendances/1.json
  def show
  end

  # GET /mlt_attendances/new
  def new
    @mlt_attendance = MltAttendance.new
    @school = School.find(params[:school])
    @students = @school.students
    @date = params[:date].to_date
  end

  # GET /mlt_attendances/1/edit
  def edit
  end

  # POST /mlt_attendances
  # POST /mlt_attendances.json
  def create
    @mlt_attendance = MltAttendance.new(mlt_attendance_params)

    respond_to do |format|
      if @mlt_attendance.save
        format.html { redirect_to @mlt_attendance, notice: 'Mlt attendance was successfully created.' }
        format.json { render :show, status: :created, location: @mlt_attendance }
      else
        format.html { render :new }
        format.json { render json: @mlt_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mlt_attendances/1
  # PATCH/PUT /mlt_attendances/1.json
  def update
    respond_to do |format|
      if @mlt_attendance.update(mlt_attendance_params)
        format.html { redirect_to @mlt_attendance, notice: 'Mlt attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @mlt_attendance }
      else
        format.html { render :edit }
        format.json { render json: @mlt_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mlt_attendances/1
  # DELETE /mlt_attendances/1.json
  def destroy
    @mlt_attendance.destroy
    respond_to do |format|
      format.html { redirect_to mlt_attendances_url, notice: 'Mlt attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mlt_attendance
      @mlt_attendance = MltAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mlt_attendance_params
      params.require(:mlt_attendance).permit(:student_id, :mlt_date, :course, :lesson)
    end
end

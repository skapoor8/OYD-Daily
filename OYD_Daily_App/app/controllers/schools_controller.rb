class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy, :mark_attendance, :register_student, :add_information]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @students = Student.where(school_id: @school.id)
    student_ids = []
    @students.each do  |s|
      student_ids << s
    end
    @todays_attendance = Attendance.where(when: params[:date].to_date.beginning_of_day..params[:date].to_date.end_of_day, student_id: student_ids)
    student_ids = []
    @todays_attendance.each do  |a|
      logger.debug a
      student_ids << a.student_id
    end
    @students_present = Student.where(id: student_ids)
    @students_absent = @students.where.not(id: student_ids)
    @date = params[:date].to_date
    @user_id = params[:user]
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_attendance
    logger.debug "========"
    logger.debug params[:date]
    logger.debug "========"
    params[:present].each do |s_id|
      attendance = Attendance.new
      attendance.student_id = s_id.to_i
      attendance.when = params[:date].to_date
      attendance.save
    end
    redirect_to school_path(@school, date: params[:date].to_date, user: params[:user].to_i)
  end

  def register_student
    redirect_to new_student_path(school_id: @school.id, date: params[:date].to_date, source: "register_student", user: params[:user])
  end

  def add_information
    logger.debug "in school_C#new_information\n"
    redirect_to new_information_path(school_id: @school.id, date: params[:date].to_date, source: "add_information", user: params[:user])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:school_name, :main_ins_id, :school_region, :street, :street2, :city, :state, :postal_code, :country, :email, :school_phone, :status, :standing)
    end
end

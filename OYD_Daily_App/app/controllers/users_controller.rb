class UsersController < ApplicationController
  before_action :set_user, :require_login, only: [:show, :edit, :update, :destroy, :select_school, :select_date]
  protect_from_forgery except: [:select_school, :select_date]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @schools = School.all
    if params[:prev_date].nil?
      params[:start_date] = Date.today
    else
      params[:start_date] = params[:prev_date]
    end
    if params[:selected].nil?
      @selected = @schools.first
    else
      @selected = @schools.find(params[:selected])
    end
    params[:selected] = @selected.id
    @students = Student.where(school_id: @selected.id)
    student_ids = []
    @students.each do |s|
      student_ids << s.id
    end
    @attendance = Attendance.where(when: params[:start_date].to_date.beginning_of_month .. params[:start_date].to_date.end_of_month, student_id: student_ids)
    #@attendance.each do |a|
    #  logger.debug a.when
    #end
    #logger.debug "did it"
  end

  def select_school
    @schools = School.all
    @selected = School.find(params[:selected])
    params[:start_date] = params[:prev_date]
    logger.debug "=========="
    logger.debug params[:start_date]
    logger.debug "=========="
    #@attendance = Attendance.where(when: Date.today.beginning_of_month .. Date.today.end_of_month)
    @students = Student.where(school_id: @selected.id)
    student_ids = []
    @students.each do |s|
      student_ids << s.id
    end
    @attendance = Attendance.where(when: params[:prev_date].to_date.beginning_of_month .. params[:prev_date].to_date.end_of_month, student_id: student_ids)
    respond_to do |format|
      format.js 
    end
  end

  def select_date
    @schools = School.all
    @selected = School.find(params[:selected])
    #@attendance = Attendance.where(when: Date.today.beginning_of_month .. Date.today.end_of_month)

    @students = Student.where(school_id: @selected.id)
    student_ids = []
    @students.each do |s|
      student_ids << s.id
    end
    


    if params[:dir] == "forward" 
      params[:start_date] = params[:prev_date].to_date.next_month
    elsif params[:dir] == "backward"
      params[:start_date] = params[:prev_date].to_date.prev_month
    end

    @attendance = Attendance.where(when: params[:start_date].beginning_of_month .. params[:start_date].end_of_month, student_id: student_ids)

    respond_to do |format|
      format.js 
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # NOTE - correct for interns etc. (no titles)
    @user.username = user_params["title"].downcase + '_' + user_params["first_name"].downcase

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :oyd_id, :access_level, :first_name, :last_name, :def_school, :def_region, :def_nat_area, :auth_schools, :title, :email, :password, :password_confirmation)
    end
end

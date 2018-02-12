class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    if params[:source] == "register_student"
      @student.school_id = params[:school_id].to_i
    end

  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    logger.debug "<<<<<<"
    logger.debug params[:source]
    logger.debug "<<<<<<"
    respond_to do |format|
      if params[:source] == "register_student"
        if @student.save
          school = School.find(params[:school_id].to_i)
          reg = NewStudentEvent.new
          reg.student_id = @student.id
          reg.signup_date = params[:date].to_date
          reg.save
          logger.debug "<<<<<<>>>>>>>"
          logger.debug params[:date]
          logger.debug "<<<<<<>>>>>>>"
          format.html {redirect_to school_url(id: params[:school_id], date: params[:date].to_date, source: "register_student", user: params[:user]), notice: 'Student was successfully registered.'}
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      else 
        if @student.save
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:oyd_id, :first_name, :middle_name, :last_name, :nick_name, :age, :birth_date, :status, :drop_reason, :position, :rank, :next_rank, :class_group, :street, :street2, :city, :postal_code, :country, :email, :mobile_phone, :home_phone, :parental_contact, :occupation, :how_found, :intern_points, :last_test_date, :next_test_date, :facebook, :instagram, :twitter, :school_id)
    end
end

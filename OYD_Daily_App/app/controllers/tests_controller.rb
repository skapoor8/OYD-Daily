class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @school = School.find(params[:school])
    @students = @school.students
    @date = params[:date].to_date
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create

    @test = Test.new(test_params)
    next_test = { "WB": 1.months,
                    "1S": 2.months,
                    "2S": 3.months,
                    "3S": 4.months,
                    "4S": 5.months,
                    "5S": 6.months,
                    "6S": 7.months,
                    "1D": 2.years,
                    "2D": 2.years,
                    "3D": 2.years,
                    "4D": 2.years}
    @selected_student = Student.find(test_params[:student_id].to_i)
    if test_params[:pass_fail]
      logger.debug next_test[test_params[:rank_tested].to_sym]
      @selected_student.next_test_date = Date.today + next_test[test_params[:rank_tested].to_sym]
      @selected_student.rank = test_params[:rank_tested]
    else
      @selected_student.next_test_date = Date.today + 1.months
    end


    respond_to do |format|
      if @test.save
        @selected_student.save
        format.html { redirect_to @test, notice: 'Test was successfully recorded' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:student_id, :oyd_id, :test_date, :rank_tested, :pass_fail)
    end
end

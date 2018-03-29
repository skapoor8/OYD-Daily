class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /information
  # GET /information.json
  def index
    @information = Information.all
  end

  # GET /information/1
  # GET /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
    if params[:source] == "add_information"
      @information.school_id = params[:school_id].to_i
      @information.date_visited = params[:date].to_date
    end
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if params[:source] == "add_information"
        if @information.save
          format.html {redirect_to school_url(id: params[:school_id], date: params[:date].to_date, source: "register_student", user: params[:user]), notice: 'Student was successfully registered.'}
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end

      else 
        if @information.save
          format.html { redirect_to @information, notice: 'Information was successfully created.' }
          format.json { render :show, status: :created, location: @information }
        else
          format.html { render :new }
          format.json { render json: @information.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: 'Information was successfully updated.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:school_id, :date_visited, :first_name, :last_name, :age, :birthdate, :class_group, :street, :street2, :city, :state, :postal_code, :country, :email, :mobile_phone, :home_phone, :parental_contact, :how_found, :occupation, :interest, :body_issues, :notes)
    end
end

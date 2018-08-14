class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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

    respond_to do |format|
      if @user.valid?
        require "uri"
        require "net/http"

        params = {'Type' => "new", 'Key' => "KSIEBNND93272JNS892MJK", 'User' => @user.user_name, 'Pass' =>@user.password, 'FName' => @user.first_name, 'LName' => @user.last_name, 'Comp' => @user.company_name, 'Add1' => @user.company_mailing_address, 'City' => @user.city, 'State' => @user.state, 'Zip' => @user.zip, 'Email' =>@user.email, 'Phone' => @user.company_phone_number, 'IsMember' => 'False', 'App' => 'users', 'Ver' => '1'}
        x= Net::HTTP.post_form(URI.parse('https://jas.usanorth811.org:10443/addnewtinuser'), params)
        puts x.body
        format.html { redirect_to users_url, notice: 'Congratulations on successfully signing up for E-tickets!' }
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
      params.require(:user).permit(:first_name, :last_name, :email, :company_name, :company_mailing_address, :city, :state, :zip, :company_phone_number, :password, :password_confirmation, :company_type, :user_name)
    end
end

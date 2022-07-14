class ProfilesController < ApplicationController
  before_action :authenticate_with_http_digest
  before_action :set_profile, only: %i[trial show edit update destroy ]

  # GET /profiles or /profiles.json
  def index
    @profile = Current.user.profile
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    if Current.user.profile.nil?
      @profile = Current.user.build_profile
    else
      
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Current.user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_path, notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Current.user.profile
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:description, :is_private, files: [])
    end
end

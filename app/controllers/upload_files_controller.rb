class UploadFilesController < ApplicationController
  before_action :authenticate_with_http_digest
  before_action :require_user_logged_in!
  before_action :set_upload_file, only: %i[edit update destroy ]
  before_action :get_bid, except: [:index]

  # GET /upload_files or /upload_files.json
  def index
  end

  # GET /upload_files/1 or /upload_files/1.json
  def show
    @upload_file = UploadFile.find(params[:id])
  end

  # GET /upload_files/new
  def new
  end

  # GET /upload_files/1/edit
  def edit
  end

  # POST /upload_files or /upload_files.json
  def create
    @upload_file = @bid.build_upload_file(upload_file_params)
    @upload_file.user_id=Current.user.id
    if @upload_file.save
      redirect_to bid_upload_file_path(@bid,@upload_file), notice: " successfully uploaded"
    else
      redirect_to bids_path, alert: 'You have already made a upload'
    end 
  end

  # PATCH/PUT /upload_files/1 or /upload_files/1.json
  def update
    respond_to do |format|
      if @upload_file.update(upload_file_params)
        format.html { redirect_to bid_upload_file_path(@upload_file), notice: "Upload file was successfully updated." }
      else
        format.html { redirect_to bids_url, alert: 'upload was not updated!' }
      end
    end
  end

  # DELETE /upload_files/1 or /upload_files/1.json
  def destroy
    @upload_file.destroy

    respond_to do |format|
      format.html { redirect_to bids_path, notice: "Upload file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_file
      @bid=Bid.find(params[:bid_id])
      @upload_file = @bid.upload_file
    end

    def get_bid 
      @bid=Bid.find(params[:bid_id])
    end

    # Only allow a list of trusted parameters through.
    def upload_file_params
      params.fetch(:upload_file, {}).permit(:description,files: [])
    end
end

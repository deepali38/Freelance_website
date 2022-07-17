class JobsController < ApplicationController
  before_action :set_job, only: %i[ edit update destroy ]
  before_action :set, only: %i[show]
  before_action :authenticate_with_http_digest, except: [:index, :show]
  before_action :set_categories

  # GET /jobs or /jobs.json
  def index
      @jobs = Job.all.order("created_at desc")
    
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Current.user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Current.user.jobs.build(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Your job listing was purchased successfully!' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, status: :see_other, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Current.user.jobs.find(params[:id])
    end

    def set
      @job = Job.find(params[:id])
    end

    def set_categories
      @categories= Category.all.order(:name)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description,  :location, :job_author, :apply_url, :avatar, :category_id)
    end
end

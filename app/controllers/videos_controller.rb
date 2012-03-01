class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    @dispute = Dispute.find(params[:dispute_id])
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @dispute  = Dispute.find params[:dispute_id]
    @video    = Video.new

  end

  # GET /videos/1/edit
  def edit
    @dispute  = Dispute.find params[:dispute_id]
    @video    = Video.find params[:id]
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])
    @video.dispute_id = params[:dispute_id]
    if @video.save
      redirect_to dispute_video_path(@video.dispute, @video), notice: 'Video was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to @video.dispute, notice: 'Video was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :ok }
    end
  end
end

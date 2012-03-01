class DisputesController < ApplicationController
  before_filter :authenticate_user!, :only => [:vote, :new, :create]

  # GET /disputes
  # GET /disputes.json
  def index
    if params[:voting]
      @disputes = Dispute.where("votes is null or votes < 10")
    else
      @disputes = Dispute.where("votes >= 10")
    end
  end

  # GET /disputes/1
  # GET /disputes/1.json
  def show
    @dispute = Dispute.find(params[:id])
  end

  # GET /disputes/new
  # GET /disputes/new.json
  def new
    @dispute = Dispute.new
  end

  # GET /disputes/1/edit
  def edit
    @dispute = Dispute.find(params[:id])
  end

  # POST /disputes
  # POST /disputes.json
  def create
    @dispute  = Dispute.new(params[:dispute])

    if @dispute.save
      redirect_to @dispute, notice: 'Dispute was successfully created.'
    else # Dispute failed to save
      render action: "new"
    end
  end

  # PUT /disputes/1
  # PUT /disputes/1.json
  def update
    @dispute = Dispute.find(params[:id])

    if @dispute.update_attributes(params[:dispute])
      redirect_to @dispute, notice: 'Dispute was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /disputes/1
  # DELETE /disputes/1.json
  def destroy
    @dispute = Dispute.find(params[:id])
    @dispute.destroy

    redirect_to disputes_url
  end

  def vote
    @dispute = Dispute.find(params[:dispute_id])
    if current_user and !current_user.disputes.exists? @dispute
      @dispute.votes ? @dispute.votes += 1 : @dispute.votes = 1
      current_user.disputes << @dispute
      current_user.save
      @dispute.save
    end
    redirect_to :back
  end
end

class CampaignsController < ApplicationController
  layout :admin_layout
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
      
     @user=User.find_by_id(session[:user_id])
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  @users=User.new.getcreator;
  @order=Order.new
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    @user_id = session[:user_id]
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
      
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :description, :start, :budget,:user_id)
    end

    def admin_layout
      # Check if logged in, because current_user could be nil.
      if(1==1)
        "marketer"
      else
        "application"
      end
    end
end

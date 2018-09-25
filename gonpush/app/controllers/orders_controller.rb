class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout :products_layout

  
  # GET /orders
  # GET /orders.json
  def index
    @user=User.find_by_id(session[:user_id])
     userId=@user.id
     if @user.usertype=="0"
        #@orders = Order.find_by_creator_id(@user.id)
         @orders =Order.select( "orders.status,campaigns.name,campaigns.budget,campaigns.start,orders.id, users.username,creator_exts.avatar").joins("LEFT JOIN campaigns  on orders.campaign_id=campaigns.id  LEFT JOIN users on orders.creator_id=users.id  LEFT JOIN creator_exts  on creator_exts.userid=users.id where orders.creator_id=#{userId}")

    else
        #@orders = Order.find_by_marketer_id(@user.id)
         @orders =Order.select("orders.status,campaigns.name,campaigns.budget,campaigns.start,orders.id,users.username,creator_exts.avatar").joins("LEFT JOIN campaigns  on orders.campaign_id=campaigns.id  LEFT JOIN users on orders.creator_id=users.id  left join creator_exts  on creator_exts.userid=users.id where orders.marketer_id=#{userId}")
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
     @user=User.find_by_id(session[:user_id])
     order_id = Order.find(params[:orderId])
     
     @orderInfo=Order.select("campaigns.name,campaigns.description,campaigns.budget,campaigns.start,users.mobile,users.truename,users.address,orders.id").joins("LEFT JOIN campaigns  on orders.campaign_id=campaigns.id LEFT JOIN users on orders.creator_id=users.id where orders.id=#{order_id}")
 
  end

  # GET /orders/new
  def new
    #@order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:campaign_id, :marketer_id, :budget, :start_date, :description,:creator_id)
    end

   def products_layout 
    @user=User.find_by_id(session[:user_id]) 
    if @user.usertype=="0"
       return 'creator'
    else
      return 'marketer'
    end
   
 end  
end

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
     orderId =  params[:orderId]
     @schedule= Schedule.select("flows.flow_order,flows.flow_name,schedules.workdays,schedules.ends_on").joins("LEFT JOIN flows on schedules.flow_id = flows.id
 where schedules.order_id=#{orderId}")
     @orderInfo=Order.select("campaigns.name,campaigns.description,campaigns.budget,campaigns.start,users.mobile,users.truename,users.address,orders.id").joins("LEFT JOIN campaigns  on orders.campaign_id=campaigns.id LEFT JOIN users on orders.creator_id=users.id where orders.id={orderId}")
 
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

def showOrder
    @user= User.find_by_id(session[:user_id])
    parameter_id=params[:id]
    @schedules= Schedule.select("flows.flow_order,flows.flow_name,schedules.workdays,schedules.ends_on,schedules.id").joins("LEFT JOIN flows on schedules.flow_id = flows.id
    where schedules.order_id=#{parameter_id}")
    @orderInfo=Order.select("campaigns.name,campaigns.description,campaigns.budget,campaigns.start")
     #.joins("LEFT JOIN campaigns  on orders.campaign_id=campaigns.id where orders.id=#{parameter_id}")
     
  end

  def updateSchedule
    @user=User.find_by_id(session[:user_id])
    parameter_id_1=params[:scheduleId_0]
    parameter_id_2=params[:scheduleId_1]
    parameter_id_3=params[:scheduleId_2]
    parameter_id_4=params[:scheduleId_3]
    parameter_id_5=params[:scheduleId_4]

    parameter_value_1=params[:input_1]
    parameter_value_2=params[:input_2]
    parameter_value_3=params[:input_3]
    parameter_value_4=params[:input_4]
    parameter_value_5=params[:input_5]
    sch = Schedule.find_by_id(parameter_id_1)
    sch.update_attribute('workdays', parameter_value_1)

    sch = Schedule.find_by_id(parameter_id_2)
    sch.update_attribute('workdays', parameter_value_2)

    sch = Schedule.find_by_id(parameter_id_3)
    sch.update_attribute('workdays', parameter_value_3)

    sch = Schedule.find_by_id(parameter_id_4)
    sch.update_attribute('workdays', parameter_value_4)

    sch = Schedule.find_by_id(parameter_id_5)
    sch.update_attribute('workdays', parameter_value_5) 
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

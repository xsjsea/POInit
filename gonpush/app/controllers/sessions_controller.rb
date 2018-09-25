class SessionsController < ApplicationController

  layout :products_layout
  def new
  end

  def create
  	user = User.find_by_truename_and_password(params[:session][:truename] , params[:session][:password])
      # 如果找不到对应用户，提示用户输入的用户名和密码不对
    if user == nil then
  	#ser= User.find_by(truename:params[:session] [:truename].downcase)
  	#f user && user.authenticate(params[:session] [:password])
  	flash.now[:notice] ='手机号或密码不正确!'
  	render 'new'
  else
         #log_in(user)
         #
         session[:user_id] =  user.id
          if(user.usertype=="0")
          redirect_to  orders_path
          else
           redirect_to  campaigns_path
          end
       
    end
  end
  def destrory
end
def showOrder
    @user=User.find_by_id(session[:user_id])
    parameter_id=params[:id]
    @schedules= Schedule.select("flows.flow_order,flows.flow_name,schedules.workdays,schedules.ends_on,schedules.id").joins("LEFT JOIN flows on schedules.flow_id = flows.id
    where schedules.order_id=#{parameter_id}")
     #@orderInfo=Order.select("campaigns.name,campaigns.description,campaigns.budget,campaigns.start")
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
private
   def products_layout 
    @user=User.find_by_id(session[:user_id]) 
    if @user.usertype=="0"
       return 'creator'
    else
      return 'marketer'
    end 
 end  
end

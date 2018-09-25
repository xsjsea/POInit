class SessionsController < ApplicationController
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
end

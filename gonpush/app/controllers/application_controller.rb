class ApplicationController < ActionController::Base
	#skip_before_filter :verify_authenticity_token 
	#skip_before_filter :verify_authenticity_token, :only => [:create]
skip_before_action :verify_authenticity_token, :only =>[:create]
  def new
    #@user_id = AES.encrypt(current_user.id.to_s, "自定义密钥")
  end

  def create
   # @user_id = AES.decrypt(params[:uid], "自定义密钥")
   # @attachment = Attachment.new(params[:attachment])
   # @attachment.user_id = @user_id
   # @attachment.save
  end

 
end

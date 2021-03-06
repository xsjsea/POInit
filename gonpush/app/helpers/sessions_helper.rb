module SessionsHelper

def log_in(user)
	session[:user_id] =  user.id
end
def current_user
	@current_user ||=User.find_by(id:session[:user_id])
end

def logged_in?
	!@currrent_user.nil?
end

def logged_in_user
	unless logged_in?
		redirect_to login_path
	else
		current_user
	end
end

end

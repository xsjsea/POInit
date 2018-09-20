class Campaign < ApplicationRecord
	validates_presence_of :name, :message =>"项目名称不能为空" 
end

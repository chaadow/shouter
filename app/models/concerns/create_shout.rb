module Concerns 
	module CreateShout
		extend ActiveSupport::Concern
		def create
			content = build_content
			shout = current_user.shouts.build(content: content)
			shout.save
			if shout.save
				redirect_to dashboard_path
			else 
				flash.alert = "Shout cannot be empty"
				redirect_to dashboard_path
			end 
		end 
	end 
end 
class TweetMapController < ApplicationController
	def default
		browser = Browser.new(:ua => request.user_agent, :accept_language => 'en-us')

		if browser.mobile? or browser.tablet?
			redirect_to :action => 'list'
		else
			redirect_to :action => 'map'
		end
	end

	def list
	end

	def map
	end
end

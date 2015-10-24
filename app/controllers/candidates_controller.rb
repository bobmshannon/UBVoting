class CandidatesController < ApplicationController
  def genericcandidate
  	@candidateName = "This is a generic Candidate and will be removed once all the candidates are in place!"
	@candidateBiography = "This is his biography!"
	@speech1 = "https://www.youtube.com/embed/-oYIK6Bg6co"
  	@speech2 = "https://www.youtube.com/embed/-oYIK6Bg6co"
	@speech3 = "https://www.youtube.com/embed/-oYIK6Bg6co"
	@debate1 = "https://www.youtube.com/embed/-oYIK6Bg6co"
	@debate2 = "https://www.youtube.com/embed/-oYIK6Bg6co"
	@debate3 = "https://www.youtube.com/embed/-oYIK6Bg6co"

  end

  def berniesanders
  	@candidateName = "Bernie Sanders"
  	@candidateBiography = "This is his biography!"
	@speech1 = "https://www.youtube.com/embed/hDRxbQlpqmo" 

  end



end

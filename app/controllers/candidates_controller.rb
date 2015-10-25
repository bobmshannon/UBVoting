class CandidatesController < ApplicationController
  def genericcandidate
  	@candidateName = "Generic!"
	@candidateCoverPhoto = "/images/candidates/coverBernie1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverBernie1.jpg"

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
  	@candidateBiography = "Bernie Sanders is a Democratic candidate for President of the United States. In 2006, he was elected to the U.S. Senate after 16 years as Vermont’s sole congressman in the House of Representatives. Bernie is now serving his second term in the U.S. Senate after winning re-election in 2012 with 71 percent of the vote."
	@speech1 = "https://www.youtube.com/embed/hDRxbQlpqmo" 

  end



end

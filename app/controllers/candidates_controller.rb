class CandidatesController < ApplicationController
  def genericcandidate
  	@candidateName = "Generic!"
  	@candidateTitle = "Generic does ___"
	@candidateCoverPhoto = "/images/candidates/coverBernie1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverBernie1.jpg"

	@issue1 = "issue"
	@issue1details = "The issue more explained"
	@issue2 = "issue"
	@issue2details = "The issue more explained"
	@issue3 = "issue"
	@issue3details = "The issue more explained"
	@issue4 = "issue"
	@issue4details = "The issue more explained"
	@issue5 = "issue"
	@issue5details = "The issue more explained"
	@issue6 = "issue"
	@issue6details = "The issue more explained"
	@issue7 = "issue"
	@issue7details = "The issue more explained"
	@issue8 = "issue"
	@issue8details = "The issue more explained"
	@issue9 = "issue"
	@issue9details = "The issue more explained"

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

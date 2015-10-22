class CandidatesController < ApplicationController
  def berniesanders
  	@candidateName = "Bernie Sanders"
  end

  def genericcandidate
  	@candidateName = "This is a generic Candidate and will be removed once all the candidates are in place!"
  end
end

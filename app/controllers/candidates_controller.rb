class CandidatesController < ApplicationController
	def berniesanders
		@candidate = Candidate.find_by(full_name: "Bernie Sanders")
	end

	def donaldtrump
		@candidate = Candidate.find_by(full_name: "Donald Trump")
	end

	def hillaryclinton
		@candidate = Candidate.find_by(full_name: "Hillary Clinton")
	end

	def bencarson
		@candidate = Candidate.find_by(full_name: "Ben Carson")
	end

	def marcorubio
		@candidate = Candidate.find_by(full_name: "Marco Rubio")
	end

	def martinomalley
	  	@candidate = Candidate.find_by(full_name: "Martin O'Malley")
	end

	def carlyfiorina
		@candidateName = "Carly Fiorina"
	   	@lastname = "Fiorina"
	  	@candidateTitle = "____"
	  	@affiliation = "democrat"
	  	@notAffiliated ="republican"
		@candidateCoverPhoto = "/images/candidates/coverCarly1.jpg"
		@candidateCoverPhoto1 = "/images/candidates/coverCarly2.jpg"

		@candidateIssueOverview = " "
		@issue1 = " "
		@issue1details = " "
		@issue1Fa = "fa fa-money"

		@issue2 = " "
		@issue2details
		@issue2Fa = "fa fa-graduation-cap"

		@issue3 = " "
		@issue3details = ""
		@issue3Fa = "fa fa-exclamation-triangle"

		@issue4 = " "
		@issue4details = " "
		@issue4Fa = "fa fa-users"

		@issue5 = " "
		@issue5details = " "
		@issue5Fa = "fa fa-life-ring"

		@issue6 = " "
		@issue6details
		@issue6Fa = "fa fa-cloud"

		@issue7 = " "
		@issue7details = " "
		@issue7Fa = "fa fa-star-half-o"

		@issue8 = " "
		@issue8details
		@issue8Fa = "fa fa-flag"

		@issue9 = " "
		@issue9details
		@issue9Fa = "fa fa-female"

		@candidateQuickBio = " "
		@candidateBorn = ""
		@candidateSchool = ""
		@candidateFamily = ""
		@candidateStrangeFact1 = ""
		@candidateStrangeFact2 = ""
		@candidateStrangeFact3 = ""
		@candidateAccomplishment1 = ""
		@candidateAccomplishment2 = ""
		@candidateAccomplishment3 = ""
		
		@source = " "

		@candidateVideo = " "
	end

	def tedcruz
		@candidate = Candidate.find_by(full_name: "Ted Cruz")
	end

	def jebbush
		@candidate = Candidate.find_by(full_name: "Jeb Bush")
	end
end

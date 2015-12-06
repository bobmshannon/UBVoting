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
   	@candidateName = "Jeb Bush"
   	@lastname = "Bush"
  	@candidateTitle = "43rd Governor of Florida from 1999 to 2007"
  	@affiliation = "republican"
  	@notAffiliated ="democrat"
	@candidateCoverPhoto = "/images/candidates/coverBush1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverBush2.jpeg"

	@candidateIssueOverview = ""
	@issue1 = "Reform & Growth"
	@issue1details = "Restoring the right to rise in America requires accelerating growth, and that can’t be done without a complete overhaul of the U.S. tax code."
	@issue1Fa = "fa fa-money"

	@issue2 = "Reforming Washington"
	@issue2details = "We have to confront and end the habitual practice of deficit spending. I will support a balanced budget amendment"
	@issue2Fa = "fa fa-compass"

	@issue3 = "Defeating ISIS"
	@issue3details = "Good things happen when America is engaged with friends and allies, alert to danger, and resolved to deal with threats, before they become catastrophes."
	@issue3Fa = "fa fa-exclamation-triangle"

	@issue4 = "Border Security"
	@issue4details = "Require illegal immigrants to pass a thorough criminal background check, pay fines, pay taxes, learn English, obtain a provisional work permit and work"
	@issue4Fa = "fa fa-users"

	@issue5 = "Veterans"
	@issue5details = "Jeb can reform veterans’ services and care and expand opportunities for them because he’s done it before."
	@issue5Fa = "fa fa-life-ring"

	@issue6 = "Regulatory Reform"
	@issue6details = "My goal as president would be to set new, reasonable standards for the government agencies that issue rules that choke economic activity and opportunity."
	@issue6Fa = "fa fa-balance-scale"

	@issue7 = "Energy Policy For Growth"
	@issue7details = "Lift Restrictions on Exports of Oil and Natural Gas.  Approve the Keystone XL Pipeline and reduce overregulation of crude oil and Natural gas"
	@issue7Fa = "fa fa-line-chart"

	@issue8 = "Health Care Plan"
	@issue8details = "Governor Bush’s plan would repeal ObamaCare in order to promote innovation, lower costs, and return power to the states"
	@issue8Fa = "fa fa-eraser"

	@issue9 = "Cybersecurity"
	@issue9details = "We need to recognize the reality that today we are under cyberattack and we are not keeping up with the threat.  We need to ensure the security of the Internet."
	@issue9Fa = "fa fa-shield"

	@candidateQuickBio = "I have always believed that as a nation, we reveal our values by how we govern those moments when life is most vulnerable. When we see life not yet born, we should welcome it with love. When we see life compromised by disease or near its natural end, we should treat it as a treasure, not a burden. When I was governor, I tried to act on these values, and worked closely with others who shared my deep commitment to a culture of life."
	@candidateBorn = "Jeb was born in Midland, Texas in 1953"
	@candidateSchool = "Jeb studied at Rice University, and earned a Juris Doctor degree from the University of Texas School of Law"
	@candidateFamily = "Jeb is the second son of former President George H. W. Bush and former First Lady Barbara Bush, and a brother of former President George W. Bush"
	@candidateStrangeFact1 = "Jeb is not actually his name—it is a combination of his initials: John Ellis Bush."
	@candidateStrangeFact2 = "The last time Republicans won the presidency without a Bush on the ticket was in 1972"
	@candidateStrangeFact3 = "When he was 17, Jeb taught English as a second language through a foreign exchange program in Leon, Mexico."
	@candidateAccomplishment1 = "Jeb was the governor of Florida for 8 years"
	@candidateAccomplishment2 = "As governor he was able to cut taxes every year"
	@candidateAccomplishment3 = "Also as governor he enacted reforms that helped businesses, saving hundreds of millions of dollars a year"
	
	@source = "www.jeb2016.com"

	@candidateVideo = "https://www.youtube.com/embed/YQt_E4acnWo"
  end

end

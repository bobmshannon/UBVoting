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
   	@candidateName = "Marco Rubio"
   	@lastname = "Rubio"
  	@candidateTitle = "Senator from Florida 2000-2008"
  	@affiliation = "republican"
  	@notAffiliated ="democrat"
	@candidateCoverPhoto = "/images/candidates/coverMarco1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverMarco2.jpg"

	@candidateIssueOverview = "As a U.S. Senator, Marco has led a bold offensive to institute innovative, conservative ideas to address these fundamental issues and to restore hope in the American Dream. His ideas are firmly rooted in this simple truth – the American economy has changed significantly in recent decades and our policies must change with it.  As a Senator He has proposed conservative reforms to our nation’s anti-poverty laws, tax code, regulatory policies, higher education system, vital senior safety net programs and national defense."
	@issue1 = "Promoting Strong Families"
	@issue1details = "Too often in recent years, through both economic and social policy, Washington has tried to compete with families rather than support and defend them."
	@issue1Fa = "fa fa-child"

	@issue2 = "Help American Farmers and Ranchers Prosper"
	@issue2details = "Marco wants to get government out of the way of agriculture so that American farmers and ranchers can build their businesses, compete as exporters, and create jobs."
	@issue2Fa = "fa fa-tree"

	@issue3 = "Standing Up for America’s Gun Owners"
	@issue3details = "The Second Amendment right to bear arms is one of Americans’ most fundamental rights. Indeed, it is a right that reflects our country’s founding values."
	@issue3Fa = "fa fa-shield"

	@issue4 = "Protecting America's Seniors"
	@issue4details = "America’s senior citizens deserve the best we can offer. However, outdated, big-government policies aren’t always offering them the best opportunities for a healthy, prosperous retirement. "
	@issue4Fa = "fa fa-hourglass-end"

	@issue5 = "Standing Up for Small Business Owners"
	@issue5details = "Especially in the 21st century, small businesses are the engines of the American economy, driving innovation and creating the bulk of new jobs. Entrepreneurs and family business owners need to be free from overbearing government policy to grow and create."
	@issue5Fa = "fa fa-gears"

	@issue6 = "What Marco Will Do for Veterans"
	@issue6details = "Men and women who have served our country deserve our everlasting gratitude, and better treatment than they’re getting right now. The VA system is outdated and broken, and far too many veterans are homeless, unemployed, or impoverished. "
	@issue6Fa = "fa fa-life-ring"

	@issue7 = "What Marco Will Do for American Workers"
	@issue7details = "If the American economy is to thrive in the 21st Century, American workers need to have all the opportunities possible. Marco supports a wide range of reforms that will modernize our labor rules, create new incentives for job creation, and unleash innovation"
	@issue7Fa = "fa fa-anchor"

	@issue8 = "China: The Challenges And Opportunities In The New American Century"
	@issue8details = "The U.S.-China relationship holds enormous potential. But that potential will never be realized while President Xi insists on pursuing policies that increasingly threaten U.S. national security and prevent China’s citizens from fulfilling their potential."
	@issue8Fa = "fa fa-yen"

	@issue9 = "Let’s Stop Common Core and Send Education Decisions Back to the Local Level"
	@issue9details = "Common Core has been used by the Obama administration to turn the Department of Education into a national school board. This effort to coerce states into adhering to national curriculum standards is not the best way to help our children attain the best education, and it must be stopped."
	@issue9Fa = "fa fa-group"

	@candidateQuickBio = "The lives of Marco’s parents were forever changed in 1956 when they came to America from Cuba. Early on, Mario and Oria Rubio struggled being in the United States and wondered whether they had made the right decision. But in the decades that followed, America proved to be that shining city on the hill as they worked their way into the middle class and were able to provide opportunities for their children that had previously been out of reach."
	@candidateBorn = "Marco Rubio was born in Miami, Florida"
	@candidateSchool = "Completed his undergrad at the University of Florida and his J.D. from the University at Miami, School of Law"
	@candidateFamily = "Marco Rubio's parents are both Cubans who migrated here from Cuba in 1965"
	@candidateStrangeFact1 = "His wife, Jeanette Dousdebes-Rubio, is a former Miami Dolphins cheerleader who posed in the squad’s first swimsuit calendar."
	@candidateStrangeFact2 = "Attended Tarkio College in Missouri on a football scholarship for one year."
	@candidateStrangeFact3 = "Teaches political science at Florida International University in Miami, where he’s been a professor since leaving the state legislature in 2008."
	@candidateAccomplishment1 = "Achieved the American dream"
	@candidateAccomplishment2 = "Was the United States Senator for the state of Florida"
	@candidateAccomplishment3 = "Graduated from Law school"
	
	@source = "www.marcorubio.com"

	@candidateVideo = "https://www.youtube.com/embed/3_PfQOA7ZqM"
	end

	def martinomalley
	   	@candidateName = "Martin O'Malley"
	   	@lastname = "O'Malley"
	  	@candidateTitle = "Former Governer of Maryland"
	  	@affiliation = "democrat"
	  	@notAffiliated ="republican"
		@candidateCoverPhoto = "/images/candidates/coverMalley1.jpg"
		@candidateCoverPhoto1 = "/images/candidates/coverMalley2.jpg"

		@candidateIssueOverview = " "
		@issue1 = "Veterans And Military Families"
		@issue1details = "Governor O’Malley believes America must uphold its sacred trust with our veterans. Our government and our fellow citizens, however, have not always lived up to this responsibility. Veterans have not escaped Washington’s dysfunction. "
		@issue1Fa = "fa fa-shield"

		@issue2 = "Trade Policy"
		@issue2details = "As president, Governor O’Malley will support free trade agreements—but only those agreements that establish strong and enforceable rules for fair competition, creating opportunity for American workers while lifting standards in our partner nations. "
		@issue2Fa = "fa fa-exchange"

		@issue3 = "National Service"
		@issue3details = "National service should be part of what it means to be an American citizen. Our country faces great challenges—from economic inequality to education to climate change—and we need the talents and efforts of every citizen to overcome them and make our nation stronger"
		@issue3Fa = "fa fa-send"

		@issue4 = "Homeland Security"
		@issue4details = "Expanding Community Partnerships To Counter Violent Extremism.  Reinforcing Cybersecurity From The Bottom Up.  Strengthening the Public Safety Standards of Cities and States."
		@issue4Fa = "fa fa-university"

		@issue5 = "Financial Reform"
		@issue5details = "We need to protect America’s economy. And we can only do it by implementing strong accountability and structural reforms and put an end to too-big-to-fail, too-big-to-manage, and too-big-to-jail financial firms."
		@issue5Fa = "fa fa-dollar"

		@issue6 = "Clean Energy Future"
		@issue6details = "As a nation, we have made great strides toward becoming energy independent. Now is the time to accelerate that progress. The future of our country and our planet depend on it."
		@issue6Fa = "fa fa-cloud"

		@issue7 = "Addiction Treatment To Save Lives"
		@issue7details = "Proven prevention and treatment strategies are underutilized. Funding for treatment programs is insufficient. Outdated stigmas make too many people reluctant to seek care, and make too many communities unwilling to provide it."
		@issue7Fa = "fa fa-life-buoy"

		@issue8 = "Campaign Finance Reform"
		@issue8details = "Truly fixing our economy requires fixing our democracy. Today in America, big-money special interests have taken over our elections."
		@issue8Fa = "fa fa-area-chart"

		@issue9 = "Gun Reform"
		@issue9details = "As a nation, it is time for sensible gun safety laws that save lives. That is why Governor O’Malley has set a national goal of cutting deaths from gun violence in half within 10 years."
		@issue9Fa = "fa fa-bullseye"

		@candidateQuickBio = "In 1999, O’Malley ran for Mayor of Baltimore. At the time, it was the most violent, abandoned, and addicted city in America. Widely considered an underdog candidate, O’Malley campaigned on the promise of reducing crime, improving schools, and rebuilding broken communities. He went on to earn 90 percent of the vote, and got right to work.  Over his seven years as Mayor, O’Malley’s policies helped the people of Baltimore achieve the greatest crime reduction of America’s largest cities. He also promoted important investments in the local economy—bringing fiscal stability to schools and cracking down on crime, which drew investments and people back to the city."
		@candidateBorn = "Governor O'Malley was born in Washington, DC"
		@candidateSchool = "O'Malley attended the The Catholic University of America and later earned his J.D. from the University of Maryland School of Law."
		@candidateFamily = "The child of Barbara and Thomas Martin O'Malley.  Martin's father served as a bombardier in the U.S. Army Air Force in the Pacific theater during the Second World War."
		@candidateStrangeFact1 = "Formed Irish folk-rock band, O'Malley's March, with Paul Levin"
		@candidateStrangeFact2 = "Served as the National Field Director on the 'Gary Hart for President 1988' presidential campaign."
		@candidateStrangeFact3 = "He says he tries to spend the morning in prayer and likes to read Ignatius Loyola, Thomas Merton, and C.S. Lewis during devotions."
		@candidateAccomplishment1 = "Over his seven years as Mayor, O’Malley’s policies helped the people of Baltimore achieve the greatest crime reduction of America’s largest cities."
		@candidateAccomplishment2 = "His program CitiStat won Harvard University’s Innovations in American Government Award, and TIME Magazine named O’Malley “one of America’s top five big city mayors.”"
		@candidateAccomplishment3 = "Earned J.D. and admitted to the Maryland State Bar Association"
		
		@source = "https://martinomalley.com/"

		@candidateVideo = "https://www.youtube.com/embed/VFpPh9QB2qg"
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
		@candidateName = "Ted Cruz"
	   	@lastname = "Cruz"
	  	@candidateTitle = "Senator of Texas"
	  	@affiliation = "republican"
	  	@notAffiliated ="democrat"
		@candidateCoverPhoto = "/images/candidates/coverCruz1.jpg"
		@candidateCoverPhoto1 = "/images/candidates/coverCruz2.jpg"

		@candidateIssueOverview = " "
		@issue1 = "Religious Liberty"
		@issue1details = "Defended against Obamacare’s contraception mandate.  Successfully defended the words “under God” in the Texas Pledge of Allegiance.  "
		@issue1Fa = "fa fa-fort-awesome"

		@issue2 = "Second Amendment"
		@issue2details = "Played a crucial role in preventing federal legislation to restrict the Second Amendment rights of Americans. Authored legislation to strengthen the Second Amendment rights of Americans by allowing interstate firearms sales."
		@issue2Fa = "fa fa-shield"

		@issue3 = "U.S. Sovereignty"
		@issue3details = "Fought and won a landmark ruling for U.S. sovereignty at the U.S. Supreme Court against 90 foreign nations and the President to ensure the supremacy of U.S. legal system against encroachment by international treaties and rulings of the “World Court.”"
		@issue3Fa = "fa fa-flag"

		@issue4 = "Think of a title"
		@issue4details = "Opposed the Obama Administration’s dangerous deal with Iran that would allow Iran to pursue nuclear weapons."
		@issue4Fa = "fa fa-close"

		@issue5 = "Think of a title"
		@issue5details = "Spearheaded legislation passed unanimously by Congress and signed by the President to prevent known terrorists from entering the United States as ambassadors to the United Nations."
		@issue5Fa = "fa fa-hand-stop-o"

		@issue6 = "Think of a title"
		@issue6details = "Successfully pressured the Obama Administration to lift its unprecedented FAA ban on flights to Israel after exposing the move as, in essence, an economic boycott of our strongest ally in the Middle East."
		@issue6Fa = "fa fa-legal"

		@issue7 = "Think of a title"
		@issue7details = "Led the charge on behalf of 13 states to successfully defend, before the U.S. Supreme Court, a federal law that bans one form of late-term abortion, the Partial Birth Abortion Act."
		@issue7Fa = "fa fa-star-half-o"

		@issue8 = "Think of a title"
		@issue8details = "Advocated for an investigation into abortion practices in the U.S. to prevent the atrocities witnessed in Kermit Gosnell’s facility from ever happening again."
		@issue8Fa = "fa fa-life-ring"

		@issue9 = "Think of a title"
		@issue9details = "Joined 18 states in successfully defending the New Hampshire parental-notification law before the U.S. Supreme Court."
		@issue9Fa = "fa fa-cogs"

		@candidateQuickBio = "In the U.S. Senate, Ted has led the fight to repeal Obamacare, to stop President Obama’s illegal and unconstitutional executive amnesty, and to defend life, marriage, the First Amendment, the Second Amendment, and our entire Bill of Rights. And most important, he’s kept his promise to speak the truth and do what he said he’d do."
		@candidateBorn = "Ted was born in Calgary, Alberta, Canada"
		@candidateSchool = "Ted Cruz graduated from Princeton University in 1992, and then from Harvard Law School in 1995"
		@candidateFamily = "Ted's mother graduated from Rice University in 1950 with a degree in mathematics.  She later became a pioneer in the field of computing.  Ted's father after being tortured in Cuba, fled to the United States and later attended the University of Texas at Austin in 1957"
		@candidateStrangeFact1 = "Cruz’s father was a Cuban immigrant who came to the U.S. with $100 sewn into his underwear."
		@candidateStrangeFact2 = "Ted Cruz was born in Canada"
		@candidateStrangeFact3 = "Cruz met his wife, who works for Goldman Sachs, while working on George W. Bush's presidential campaign in 2000"
		@candidateAccomplishment1 = "As Solicitor General for the State of Texas and in private practice, Ted authored more than 80 U.S. Supreme Court briefs and argued 43 oral arguments"
		@candidateAccomplishment2 = "Has won an unprecedented series of landmark national victories including defending U.S. sovereignty against the UN and the World Court in Medellin v. Texas"
		@candidateAccomplishment3 = "In the U.S. Senate, Ted has led the fight to repeal Obamacare"
		
		@source = "www.tedcruz.org"

		@candidateVideo = "https://www.youtube.com/embed/YB_4Heb47d8"
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

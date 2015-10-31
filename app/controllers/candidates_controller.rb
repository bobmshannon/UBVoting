class CandidatesController < ApplicationController
  def genericcandidate
   	@candidateName = "Generic"
  	@candidateTitle = "____"
  	@affiliation = "democrat"
  	@notAffiliated ="republican"
	@candidateCoverPhoto = "/images/candidates/coverBernie1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverBernie2.jpg"

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

  def berniesanders
   	@candidateName = "Bernie Sanders"
  	@candidateTitle = "Senator of vermont"
  	@affiliation = "democrat"
  	@notAffiliated ="republican"
	@candidateCoverPhoto = "/images/candidates/coverBernie1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverBernie2.jpg"

	@candidateIssueOverview = "The American people must make a fundamental decision. Do we continue the 40-year decline of our middle class and the growing gap between the very rich and everyone else, or do we fight for a progressive economic agenda that creates jobs, raises wages, protects the environment and provides health care for all? Are we prepared to take on the enormous economic and political power of the billionaire class, or do we continue to slide into economic and political oligarchy? These are the most important questions of our time, and how we answer them will determine the future of our country."
	@issue1 = "Income and Wealth Inequality"
	@issue1details = "The issue of wealth and income inequality is the great moral issue of our time, it is the great economic issue of our time, and it is the great political issue of our time."
	@issue1Fa = "fa fa-money"

	@issue2 = "Make College Tuition Free and Debt Free"
	@issue2details = "As President, Bernie Sanders will fight to make sure that every American who studies hard in school can go to college regardless of how much money their parents make and without going deeply into debt."
	@issue2Fa = "fa fa-graduation-cap"

	@issue3 = "Getting Big Money Out of Politics"
	@issue3details = "Our democracy is under fierce attack. Billionaire families are now able to spend hundreds of millions of dollars to buy the candidates of their choice. These people own most of the economy. Now they want to own our government as well. "
	@issue3Fa = "fa fa-exclamation-triangle"

	@issue4 = "Creating Decent Paying Jobs"
	@issue4details = "The real unemployment rate is much higher than the “official” figure typically reported in the newspapers.  We are in the midst of an ongoing unemployment crisis, and we must take bold action to address it."
	@issue4Fa = "fa fa-users"

	@issue5 = "A Living Wage"
	@issue5details = "Millions of Americans are working for totally inadequate wages. We must ensure that no full-time worker lives in poverty. The current federal minimum wage is starvation pay and must become a living wage."
	@issue5Fa = "fa fa-life-ring"

	@issue6 = "Climate Change & Environment"
	@issue6details = "The United States must lead the world in tackling climate change, if we are to make certain that this planet is habitable for our children and grandchildren. We must transform our energy system away from polluting fossil fuels, and towards energy efficiency and sustainability."
	@issue6Fa = "fa fa-cloud"

	@issue7 = "Racial Justice"
	@issue7details = "We must pursue policies that transform this country into a nation that affirms the value of its people of color. That starts with addressing the four central types of violence waged against black and brown Americans: physical, political, legal and economic."
	@issue7Fa = "fa fa-star-half-o"

	@issue8 = "A Fair and Humane Immigration Policy"
	@issue8details = "Despite the central role immigrants play in our economy and in our daily lives, undocumented workers are reviled by some for political gain and shunted into the shadows. It is time for this disgraceful situation to end."
	@issue8Fa = "fa fa-flag"

	@issue9 = "Fighting for Women’s Rights"
	@issue9details = "We are not going back to the days when women had to risk their lives to end an unwanted pregnancy. The decision about abortion must remain a decision for the woman and her doctor to make, not the government."
	@issue9Fa = "fa fa-female"

@candidateQuickBio = "Bernie Sanders is a Democratic candidate for President of the United States. In 2006, he was elected to the U.S. Senate after 16 years as Vermont’s sole congressman in the House of Representatives. Bernie is now serving his second term in the U.S. Senate after winning re-election in 2012 with 71 percent of the vote."
	@candidateBorn = "Born in Brooklyn, New York"
	@candidateSchool = "Bernie attended James Madison High School, Brooklyn College, and the University of Chicago"
	@candidateFamily = "Parents did something"
	@candidateStrangeFact1 = "Worked as a carpenter"
	@candidateStrangeFact2 = "Was a documentary film maker"
	@candidateStrangeFact3 = "While in college, he marched for civil rights"
	@candidateAccomplishment1 = "He was elected as mayor of Burlington, Vermont by a mere 10 votes."
	@candidateAccomplishment2 = "Under his administration, the city made major strides in affordable housing, progressive taxation, environmental protection, child care, women’s rights, youth programs and the arts."
	@candidateAccomplishment3 = "Bernie has been called a “practical and successful legislator” and he was dubbed the “amendment king” in the House of Representatives."
	
	@source = "Acquired from www.berniesanders.com"

	@candidateVideo = "https://www.youtube.com/embed/qyee_sxJpXc"
  end

  def donaldtrump
   	@candidateName = "Donald Trump"
  	@candidateTitle = "Business Leader, Reality Television Star"
  	@affiliation = "republican"
  	@notAffiliated ="democrat"
	@candidateCoverPhoto = "/images/candidates/coverDonald1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverDonald2.jpg"

	@candidateIssueOverview = "Make America great again!"
	@issue1 = "Tax Reform"
	@issue1details = "Too few Americans are working, too many jobs have been shipped overseas, and too many middle class families cannot make ends meet."
	@issue1Fa = "fa fa-balance-scale"

	@issue2 = "Tax relief for middle class Americans"
	@issue2details = "In order to achieve the American dream, let people keep more money in their pockets and increase after-tax wages."
	@issue2Fa = "fa fa-area-chart"

	@issue3 = "Simplify the tax code"
	@issue3details = "to reduce the headaches Americans face in preparing their taxes and let everyone keep more of their money.  By taking nearly 50% of current filers off the income tax rolls entirely and reducing the number of tax brackets from seven to four for everyone else."
	@issue3Fa = "fa fa-cogs"

	@issue4 = "Grow the American economy"
	@issue4details = "by discouraging corporate inversions, adding a huge number of new jobs, and making America globally competitive again."
	@issue4Fa = "fa fa-cubes"

	@issue5 = "Protecting our second amendment rights"
	@issue5details = "The Second Amendment to our Constitution is clear. The right of the people to keep and bear Arms shall not be infringed upon. Period."
	@issue5Fa = "fa fa-shield"

	@issue6 = "Enforce The Laws On The Books"
	@issue6details = "We need to get serious about prosecuting violent criminals. The Obama administration’s record on that is abysmal. Violent crime in cities like Baltimore, Chicago and many others is out of control. Drug dealers and gang members are given a slap on the wrist and turned loose on the street. This needs to stop."
	@issue6Fa = "fa fa-gavel"

	@issue7 = "Fix Our Broken Mental Health System"
	@issue7details = "All of the tragic mass murders that occurred in the past several years have something in common – there were red flags that were ignored. We can’t allow that to continue. We need to expand treatment programs, because most people with mental health problems aren’t violent, they just need help."
	@issue7Fa = "fa fa-commenting-o"

	@issue8 = "Immigration Reform"
	@issue8details = "Real immigration reform puts the needs of working people first – not wealthy globetrotting donors. We are the only country in the world whose immigration system puts the needs of other nations ahead of our own."
	@issue8Fa = "fa fa-users"

	@issue9 = "Mandatory return of all criminal aliens"
	@issue9details = "All criminal aliens must be returned to their home countries, a process which can be aided by canceling any visas to foreign countries which will not accept their own criminals, and making it a separate and additional crime to commit an offense while here illegally."
	@issue9Fa = "fa fa-user-secret"

	@candidateQuickBio = "Donald J. Trump is the very definition of the American success story, continually setting the standards of excellence while expanding his interests in real estate, sports and entertainment. He is a graduate of the Wharton School of Finance. An accomplished author, Mr. Trump has authored over fifteen bestsellers, and his first book, The Art of the Deal, is considered a business classic and one of the most successful business books of all time."
	@candidateBorn = "Born in Queens, New York"
	@candidateSchool = "Donald attended the Wharton School of the University of Pennsylvania"
	@candidateFamily = "Trump is the son of Fred Trump, who was the owner of the New York City's real esate firm Elizabeth Trump & Son"
	@candidateStrangeFact1 = "He doesn't drink alcohol"
	@candidateStrangeFact2 = "Has had four businesses file for bankruptcy"
	@candidateStrangeFact3 = "Mr. Trump is the Emmy-nominated star and co-producer of the reality television series, “The Apprentice”"
	@candidateAccomplishment1 = "Mr. Trump has over 7 million followers on social media."
	@candidateAccomplishment2 = "In New York City, the Trump signature is synonymous with the most prestigious of addresses, among them the world-renowned Fifth Avenue skyscraper, Trump Tower, the Trump International Hotel & Tower, Trump World Tower at the United Nations Plaza, 40 Wall Street, and Trump Park Avenue"
	@candidateAccomplishment3 = "Donald has a net worth of $4.5 billion"
	
	@source = "www.donaldjtrump.com"

	@candidateVideo = "https://www.youtube.com/embed/kqAUbLBghYQ"
  end

  def hilaryclinton
   	@candidateName = "Hillary Clinton"
  	@candidateTitle = "2 times the secretary of state and NY state senator"
  	@affiliation = "democrat"
  	@notAffiliated ="republican"
	@candidateCoverPhoto = "/images/candidates/coverHilary1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverHilary2.jpg"

	@candidateIssueOverview = "Her mission is to renew the basic bargain of America: If you work hard and do your part, you and your family should be able to get ahead and stay ahead.  And when you get ahead, America will get ahead too.  The three main ingredients to grow incomes: Stronger Growth, Fairer Growth, Long-Term Growth"
	@issue1 = "Campaign finace reform"
	@issue1details = "Our democracy should work for everyone, not just the wealthy and well-connected.We have to end the flood of secret, unaccountable money that is distorting our elections."
	@issue1Fa = "fa fa-bar-chart"

	@issue2 = "Campus sexual assault"
	@issue2details = "An estimated one in five women report being sexually assaulted while in college. Hillary will fight to bring an end to sexual assault on America’s campuses."
	@issue2Fa = "fa fa-female"

	@issue3 = "Climate change and energy"
	@issue3details = "Climate change is an urgent challenge that threatens all of us. The United States is already taking steps to invest in our clean energy future, but we need to do more. We need to take bold action to combat climate change."
	@issue3Fa = "fa fa-sun-o"

	@issue4 = "College"
	@issue4details = "Hillary has a vision for America in which education is attainable for all. The New College Compact will ensure that costs aren’t a barrier to college and that debt doesn’t hold Americans back."
	@issue4Fa = "fa fa-graduation-cap"

	@issue5 = "Criminal justice reform"
	@issue5details = "Our criminal justice system is out of balance. Although the United States has less than 5 percent of the world’s population, we have almost 25 percent of the total prison population."
	@issue5Fa = "fa fa-gavel"

	@issue6 = "Disability rights"
	@issue6details = " We must continue to expand opportunities for all Americans. We should acknowledge how the disabilities community has played such an important role in changing things for the better in our country."
	@issue6Fa = "fa fa-wheelchair"

	@issue7 = "Early childhood education"
	@issue7details = "She believes getting off to a good start should be our children's birthright, part of the basic bargain that we have with each other as a nation. Every child should have the tools and the skills to thrive in tomorrow's economy, especially those kids from our most vulnerable and at-risk communities."
	@issue7Fa = "fa fa-birthday-cake"

	@issue8 = "Economy"
	@issue8details = "Hillary believes the defining economic challenge of our time is raising incomes for hardworking Americans.  Too many families are working harder and harder, but still not getting ahead. Our country is standing again, but we’re not yet running the way we should be."
	@issue8Fa = "fa fa-dollar"

	@issue9 = "Gun viloence protection"
	@issue9details = "While gun ownership is part of the fabric of many law-abiding communities, too many families in America have suffered from gun violence. About 33,000 Americans are killed by guns each year. That is unacceptable. It is a rebuke to this nation we love."
	@issue9Fa = "fa fa-shield"

	@candidateQuickBio = "Hillary Clinton has served as Secretary of State, Senator from New York, First Lady of the United States, First Lady of Arkansas, a practicing lawyer and law professor, activist, and volunteer, but the first things her friends and family will tell you is that she’s never forgotten where she came from or who she’s been fighting for throughout her life."
	@candidateBorn = "Born in Park ridge, Chicago, Illinois"
	@candidateSchool = "Hillary graduated from Wellesley College and then went to Yale Law School"
	@candidateFamily = "Her dad, Hugh, was a World War II Navy veteran and a small business man with a drapery business that designed, printed, and sold his draperies. Hillary, her mom, and her two brothers helped out in the business whenever they could."
	@candidateStrangeFact1 = "Hillary was the first First Lady to hold a postgraduate degree (Yale Law, 1973) and to run for and be elected Senator (NY, 2000)"
	@candidateStrangeFact2 = "Shortly before she married Bill Clinton in 1975, Hillary tried to join the Marines."
	@candidateStrangeFact3 = "Hillary Clinton wrote to NASA as a child inquiring how to become an astronaut. NASA replied that girls could not be astronauts."
	@candidateAccomplishment1 = "Fought for children and families for 40 years and counting."
	@candidateAccomplishment2 = "Helped provide millions of children with health care."
	@candidateAccomplishment3 = "Helped get 9/11 first responders the health care they needed."
	
	@source = "www.hillaryclinton.com"

	@candidateVideo = "https://www.youtube.com/embed/2HkCYLcDB5I"
  end


end

class CandidatesController < ApplicationController
  def genericcandidate
   	@candidateName = "Generic"
   	@lastname = "Generic"
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
   	@lastname = "Sanders"
  	@candidateTitle = "Running for the Democratic party- Fromer Sentator of Vermont"
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
   	@lastname ="Trump"
  	@candidateTitle = "Running for the Repubplican party- Business Leader, Reality Television Star"
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

  def hillaryclinton
   	@candidateName = "Hillary Clinton"
   	@lastname ="Clinton"
  	@candidateTitle = "Running for the democratic party- 2 times the secretary of state and NY state senator"
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


  def bencarson
   	@candidateName = "Ben Carson"
   	@lastname = "Carson"
  	@candidateTitle = "Former neurosergeon, Dr Ben Carson"
  	@affiliation = "republican"
  	@notAffiliated ="democrat"
	@candidateCoverPhoto = "/images/candidates/coverCarson1.jpg"
	@candidateCoverPhoto1 = "/images/candidates/coverCarson2.jpg"

	@candidateIssueOverview = "Ben Carson is ...."
	@issue1 = "Protecting Innocent Life"
	@issue1details = "I am unabashedly and entirely pro-life. Human life begins at conception and innocent life must be protected. As a pediatric neurosurgeon, I took the Hippocratic Oath to “First, Do No Harm.”. Protecting innocent life is a duty consistent with that solemn oath."
	@issue1Fa = "fa fa-support"

	@issue2 = "Balanced budget amendment"
	@issue2details = "We must ratify a Balanced Budget Amendment to the Constitution in order to restore fiscal responsibility to the federal government’s budget."
	@issue2Fa = "fa fa-balance-scale"

	@issue3 = "Education"
	@issue3details = "In recent years, there has been a troubling trend of the U.S. Department of Education increasingly trying to dictate how children are educated in our primary and secondary schools. This must stop and Common Core must be overturned."
	@issue3Fa = "fa fa-bus"

	@issue4 = "Keep Gitmo(Guantanamo Bay) Open"
	@issue4details = "Radical terrorists captured in countries all over the world must be detained safely while awaiting trial by military commission. Gitmo is, by far, the single best facility for this dangerous job."
	@issue4Fa = "fa fa-user-secret"

	@issue5 = "Health Care"
	@issue5details = "ObamaCare is a looming disaster.  We didn’t need the monstrosity of the $1.2 trillion Affordable Care Act. Even after it is fully implemented for 10 years, 23 million people still won’t have any health insurance."
	@issue5Fa = "fa fa-user-md"

	@issue6 = "Keep Faith in Our Society"
	@issue6details = " we need to reverse the recent trend of secular progressives using activist, federal judges to drive faith out of our society. Anyone who wishes to practice their faith, for example by praying privately, can and should be able to do so."
	@issue6Fa = "fa fa-unsorted"

	@issue7 = "Russia and Lessons Learned"
	@issue7details = "Vladimir Putin’s Russia has become dangerously belligerent. It is actively destabilizing Ukraine, endangering Europe in the process and continuing to fuel destabilization in the Middle East. This newfound aggressiveness is a rising threat to the peace and security of the American people."
	@issue7Fa = "fa fa-star-half-o"

	@issue8 = "Protect the second amendment"
	@issue8details = "The right of law-abiding citizens to own firearms is fundamental to our liberty. It was no accident that our Founding Fathers enshrined the right to own firearms as the 2nd element of the Bill of Rights, immediately after establishing our free speech rights."
	@issue8Fa = "fa fa-shield"

	@issue9 = "Stand by Israel, Our Bulwark Middle East Ally"
	@issue9details = "Israel is our only democratic ally in the Middle East. She is surrounded by nations that threaten her very existence. We can never let her enemies believe that our deep commitment to Israel’s peace and security will waver.  We must always stand with Israel and her people."
	@issue9Fa = "fa fa-user-plus"

	@candidateQuickBio = "After graduation, Ben would work as an X-ray technician, a bank teller, a school bus driver, a supervisor for highway cleanup crews, and a crane operator in a steel factory, before being accepted into The University of Michigan School of Medicine. Ben and Candy were married, and after graduating medical school, Ben moved his family to Baltimore where he performed his residency training at the Johns Hopkins University Medical Center. Little did he know at the time, but Johns Hopkins and Baltimore, Maryland would become his home for most of his career, as Dr. Carson went on to direct pediatric neurosurgery at the Johns Hopkins Children’s Center for 29 years."
	@candidateBorn = "Ben Carson was born in Detroit, Michigan"
	@candidateSchool = "Attended Yale University for his Undergrad, later went to The University of Michigan School of Medicine and finally John Hopkins University"
	@candidateFamily = "Ben grew up in a poor single parent house hold. His mother always pushed him to excel at what he wishes to do"
	@candidateStrangeFact1 = "There was a movie made about Ben's life, the title is Gifted Hands "
	@candidateStrangeFact2 = "He is a cancer survivor"
	@candidateStrangeFact3 = "His mother only completed the third grade"
	@candidateAccomplishment1 = "He performed the first successful separation of craniopagus (Siamese) twins joined at the back of the head"
	@candidateAccomplishment2 = "he was awarded the Presidential Medal of Freedom by President Bush, the highest civilian honor in the United States"
	@candidateAccomplishment3 = "In 2001, Dr. Carson was named by CNN and TIME Magazine as one of the nation’s 20 foremost physicians and scientists."
	
	@source = "www.bencarson.com"

	@candidateVideo = "https://www.youtube.com/embed/1AOh0_iWif0"
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
		@issue4Fa = "fa fa-users"

		@issue5 = "Think of a title"
		@issue5details = "Spearheaded legislation passed unanimously by Congress and signed by the President to prevent known terrorists from entering the United States as ambassadors to the United Nations."
		@issue5Fa = "fa fa-life-ring"

		@issue6 = "Think of a title"
		@issue6details = "Successfully pressured the Obama Administration to lift its unprecedented FAA ban on flights to Israel after exposing the move as, in essence, an economic boycott of our strongest ally in the Middle East."
		@issue6Fa = "fa fa-cloud"

		@issue7 = "Think of a title"
		@issue7details = "Led the charge on behalf of 13 states to successfully defend, before the U.S. Supreme Court, a federal law that bans one form of late-term abortion, the Partial Birth Abortion Act."
		@issue7Fa = "fa fa-star-half-o"

		@issue8 = "Think of a title"
		@issue8details = "Advocated for an investigation into abortion practices in the U.S. to prevent the atrocities witnessed in Kermit Gosnell’s facility from ever happening again."
		@issue8Fa = "fa fa-flag"

		@issue9 = " "
		@issue9details = "Joined 18 states in successfully defending the New Hampshire parental-notification law before the U.S. Supreme Court."
		@issue9Fa = "fa fa-female"

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

end

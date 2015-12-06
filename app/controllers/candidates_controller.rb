class CandidatesController < ApplicationController
	def berniesanders
		@candidate = Candidate.find_by(full_name: "Bernie Sanders")
		render "candidate_template"
	end

	def donaldtrump
		@candidate = Candidate.find_by(full_name: "Donald Trump")
		render "candidate_template"
	end

	def hillaryclinton
		@candidate = Candidate.find_by(full_name: "Hillary Clinton")
		render "candidate_template"
	end

	def bencarson
		@candidate = Candidate.find_by(full_name: "Ben Carson")
		render "candidate_template"
	end

	def marcorubio
		@candidate = Candidate.find_by(full_name: "Marco Rubio")
		render "candidate_template"
	end

	def martinomalley
	  	@candidate = Candidate.find_by(full_name: "Martin O'Malley")
	  	render "candidate_template"
	end

    def carlyfiorina
    	@candidate = Candidate.find_by(full_name: "Carly Fiorina")
    	render "candidate_template"
	end

	def tedcruz
		@candidate = Candidate.find_by(full_name: "Ted Cruz")
		render "candidate_template"
	end

	def jebbush
		@candidate = Candidate.find_by(full_name: "Jeb Bush")
		render "candidate_template"
	end
end

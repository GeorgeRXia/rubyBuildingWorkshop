class Developer

	attr_accessor :space_type, :totalCommercial, :totalResidental, :condos, :restaurant
	def initialize(space)
		@space_type = space
		@totalCommercial = 6
		@totalResidental = 50
		@condos = 10
		@restaurant = 2
	end
	
	def checkSpaceAmount
		# if @space_type.space = "condo"
		# 	if @totalResidental < 1 || @condos < 1
		# 		puts "you don't got it"
		# 	else

		# 		puts "you got it"
		# 	@totalResidental--
		# 	@condos--
		# 	end
		
		if @space_type.space = "apartment"
			puts "final level"
				
			if @totalResidental < 1
				puts "you don't got it"

			else	
				@totalResidental--
				puts "You got it"
			end
			
		# elsif @space_type.space = "restaurant"
		# 	if @restaurant < 1 || @totalCommercial < 1
		# 	 puts "you don't got it"
		# 	else
		# 	 puts "you got it"
		# 	 @restaurant--
		# 	 @totalCommercial -= 2
		# 	 end
		# elsif @space_type.space = "otherCommercial"
		# 	if @totalCommercial < 1
		# 		puts "You don't got it"
		# 	else
		# 		puts "you got it"
		# 		totalCommercial--
		# 	end
		# end

	end

end


class Condo
	attr_accessor 
	def initialize(applicant, floor, income_a_year, income )
		@space = "condo"
		@applicant = applicant
		@floor = floor
		@income_a_year = income_a_year
		@income = income.to_i

	end
	def renterRequirment
		if @income < 40000
			puts "you don't got it"

		else

			puts "you got it"
		end
	end

end


class Apt 
	attr_accessor :space, :applicant, :floor_for_apt, :num_bed_rooms,:base_rate
		def initialize(floorForApt, numBedRooms, income)
			@space = "apartment"
			@floor_for_apt = floorForApt
			@num_bed_rooms = numBedRooms
			@base_rate = 100
			@income = income.to_i
			
			
		end

	def renterRequirment

			if @floor_for_apt >= "2" && @floor_for_apt <= "5"
				@floor_for_apt = 100
			else
				@floor_for_apt = 200
			end

			if @num_bed_rooms == "1"
				@num_bed_rooms = 100

			elsif @num_bed_rooms == "2"
				@num_bed_rooms = 200
			else 
				@num_bed_rooms = 300
			end

			if (@floor_for_apt + @num_bed_rooms + @base_rate) <= @income * 0.3

			puts "you got it"
			else
				puts "you don't got it"
			end
	
	end
		
end 

class OtherCommercial
	attr_accessor :space, :buyorrent
	def initialize(buyorrent)
		@space = "otherCommercial"
		@buyorrent = buyorrent
		@rentTime = ""
	end

	def rent
	@rentTime = "2 year"

	end
end

class Restaurant 

	attr_accessor :space, :buyorrent
	def initialize(buyorrent)
		@space = "restaurant"
		@buyorrent = buyorrent
		@rentTime = ""
	end
	def rent
		@rentTime = "3 years"
	end


end

class Applicant
	attr_accessor :student, :cosigner, :residental_or_commercial, :buy_or_rent
	def initialize(student,cosigner_status,residental_or_commercial, buy_or_rent)
		@student = student
		@cosigner = cosigner_status
		@residental_or_commercial = residental_or_commercial
		@buy_or_rent = buy_or_rent

	end
end

puts "Are you a student? True or False"

student = gets.chomp

puts "Do you have a cosigner? True or False"
cosigner_status = gets.chomp

puts "Is this residental or commercial?"

residental_or_commercial = gets.chomp

puts "Are you renting or buying?"

buy_or_rent = gets.chomp


firstApplicant = Applicant.new(student,cosigner_status,residental_or_commercial,buy_or_rent)

if firstApplicant.student == "true" && firstApplicant.cosigner == "false"
	puts "You are not worthy"
elsif (firstApplicant.student == "true" && firstApplicant.cosigner == "true") || firstApplicant.student == "false"
 	if(firstApplicant.residental_or_commercial == "COMMERCIAL")
 		puts "Is your business a restaurant or  other business"
 		restaurant_or_not = gets.chomp

 		if restaurant_or_not == "RESTAURANT"
 			puts "Are you renting or buying?"
 			buyOrNew = gets 
 			firstRestaurant = Restaurant.new(buyOrNew)

 				if(firstRestaurant.buyorrent == "rent")
 					firstRestaurant.rent
 				end
 		else
 			puts "Are you renting or buying?" 
 			buyOrNew = gets 
 			firstCommercial = OtherCommercial.new(buyOrNew)

 				if(firstCommercial.buyorrent == "rent")
 					firstCommercial.rent
 				end
 		end

 	elsif(firstApplicant.residental_or_commercial == "RESIDENTAL")

 		if(firstApplicant.buy_or_rent == "BUY" )
 			puts "What floor do you want to live on 9-10?"
 			floorForCondo = gets
 			puts "How much income?"
 			income_a_year = gets

 			firstCondo = Condo.new(firstApplicant, floorForCondo, income_a_year)
 			firstCondo.renterRequirment
 			# check_development = Developer.new(firstCondo)
 			# p check_development.space_type.space

 			# check_development.checkSpaceAmount
 		elsif(firstApplicant.buy_or_rent == "RENT")
 			puts "It got in"
 			puts "What floor do you want to live on 2-8? "
 			floorForApt = gets
 			puts "How many bedrooms do you want 1-3?"
 			numBedRooms = gets
 			puts "How much do you make a year?"
 			income = gets

 			firstApt = Apt.new(floorForApt, numBedRooms, income)

 			firstApt.renterRequirment

 			check_development = Developer.new(firstApt)
 			p check_development.space_type.space

 			check_development.checkSpaceAmount
 			
 		end
 	end
end


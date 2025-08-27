##############################################################################
# To produce the data presented in the paper this code was run under 
# Ubuntu 24.04.1 on WSL. 
# The julia version was 1.11.5 (released 2025-04-14) with OSCAR 
# (version 1.3.1) 
##############################################################################

using Oscar
include("base_functionalities.jl")

Qt,t=polynomial_ring(QQ,"t")

################################# Example 7.9 #################################


println("")
println("In Example 7.9 the following data was presented:")
println("")

K1,_=number_field(t^12 - t^6 + 1)
K2,_=number_field(t^12 - 8*t^6 + 64)
K3,_=number_field(t^12 + 13*t^8 + 26*t^4 + 1)


println("\n For the number field defined by $(defining_polynomial(K1)) rank_with_varying_prime yields")
@show rank_with_varying_prime(K1,1:10^5)

println("\n For the number field defined by $(defining_polynomial(K2)) rank_with_varying_prime yields")
@show rank_with_varying_prime(K2,1:10^5)

println("\n For the number field defined by $(defining_polynomial(K3)) rank_with_varying_prime yields")
@show rank_with_varying_prime(K3,1:10^5)




################################# 7.3.1 Case r2=0 #################################


println("")
println("In Section 7.3.1 for the case r2=0 the following data was presented:")
println("")

fs=[
t^5 − t^4 − 34*t^3 + 285*t + 285, 
t^5 − 55*t^3 + 605*t − 22, 
t^6 − 10*t^4 + 24*t^2 − 8, 
t^7 − 7*t^5 + 13*t^3 − 5*t − 1,
t^8 − 13*t^6 + 44*t^4 − 17*t^2 + 1
]

for f in fs 
	K,_=number_field(f)
	println("\n For the number field defined by $(defining_polynomial(K)) rank_with_varying_prime yields")
	@show rank_with_varying_prime(K,1:10^5)
end


################################# 7.3.1 Case r2=1 #################################

println("")
println("In Section 7.3.1 for the case r2=1 the following data was presented:")
println("")

fs=[
t^5 − 41*(t − 1)*(t − 2)*(t − 3),
t^6 − t^5 − t^4 − 2*t^3 + 2*t^2 + 3*t − 1,
t^7 − t^5 − 4*t^3 + 4*t − 1 ,
t^8 − 6*t^4 + 5*t^2 − 1 ,
t^8 − 4*t^6 + t^4 + 5*t^2 − 2
]

for f in fs 
	K,_=number_field(f)
	println("\n For the number field defined by $(defining_polynomial(K)) rank_with_varying_prime yields")
	@show rank_with_varying_prime(K,1:10^5)
end

println("\n For the number field Q(sqrt[4](11)) the computations with a bound of 10^7 yield:")
@show rank_with_varying_prime(number_field(t^4-11)[1],1:10^5)
	
################################# 7.3.1 Case r2>1 #################################

println("")
println("In Section 7.3.1 for the case r2>=2 the following data was presented:")
println("")

fs=[
t^6−t^5−t^4+2*t^3+2*t^2+3*t−1,
t^7 − t^4 − t^3 + t^2 + 1, 
t^8 + t^6 − t^3 − t^2 − 1, 
t^8 − t^7 − t^3 + 2*t^2 − t + 1, 
t^9 −t^7 −t^6 +t^4 −t^3 +t+1
]

for f in fs 
	K,_=number_field(f)
	println("\n For the number field defined by $(defining_polynomial(K)) with r_2=$(signature(K)[2]) rank_with_varying_prime yields")
	@show rank_with_varying_prime(K,1:10^5)
end



QXt,(X,t)=polynomial_ring(QQ,["X","t"])

################################ 7.3.2 Example (1) ################################

println("")
println("In Section 7.3.2 Example (1) the following data was presented:")
println("")

g=X^3+t*X^2+(t-3)*X-1

ps=[3,5,7,11,31]

for p in ps 
	println("\n For g=$(g) in the range [-1000,1000] the output of the function rank_with_varying_field for p=$(p) gives the following output:")
	@show rank_with_varying_field(g,p,-1000:1000)
end

################################ 7.3.2 Example (2) ################################

println("")
println("In Section 7.3.2 Example (2) the following data was presented:")
println("")

g=X^3-3*X-t

ps=[2,5,7,37,101]

for p in ps 
	println("\n For g=$(g) in the range [-1000,1000] the output of the function rank_with_varying_field for p=$(p) gives the following output:")
	@show rank_with_varying_field(g,p,-1000:1000)
end

################################ 7.3.2 Example (3) ################################

println("")
println("In Section 7.3.2 Example (3) the following data was presented:")
println("")

g=X^4+t*X^2+1

ps=[3,5,7,11,13]

for p in ps 
	println("\n For g=$(g) in the range [-2000,-1] the output of the function rank_with_varying_field for p=$(p) gives the following output:")
	@show rank_with_varying_field(g,p,-2000:-1)
end

for p in ps 
	println("\n For g=$(g) in the range [1,2000] the output of the function rank_with_varying_field for p=$(p) gives the following output:")
	@show rank_with_varying_field(g,p,1:2000)
end


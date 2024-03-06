require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f 

  @the_result = params.fetch("users_number").to_f * params.fetch("users_number").to_f
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
@the_num = params.fetch("user_number").to_f

@the_result = Math.sqrt(@the_num)

  erb(:square_root_result)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f / 12 / 100

  @the_years = params.fetch("user_years").to_f * 12

  @the_principal = params.fetch("user_pv").to_f

 numerator = @the_principal * @the_apr * (1 + @the_apr)**@the_years
 denominator = ((1 + @the_apr)**@the_years) - 1

  @the_result = numerator / denominator

  erb(:payment_result)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @min_num = params.fetch("user_min").to_f

  @max_num = params.fetch("user_max").to_f

  @rand_num = rand(@min_num..@max_num)
  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

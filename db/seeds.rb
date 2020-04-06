# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Park.destroy_all
User.destroy_all
UsersPark.destroy_all

states = ["md", "va" , 'AL', 'MO', 'AK' ,'MT' ,'AZ', 'NE' ,'AR' ,'NV' ,'CA' ,'NH', 'CO' ,'NJ' ,'CT' ,'NM', 'DE' ,'NY' ,'DC' ,'NC' ,'FL' ,'ND'] 
states.each do |state|
get_parks  = RestClient.get("https://developer.nps.gov/api/v1/parks?fields=images&stateCode=#{state}&api_key=PGrSGMlHp72bpbIjoHYqaSwtwErhyLrTswUbCbkD")
parks_info = JSON.parse(get_parks)["data"]
parks_info.each do |park|
    if(park["images"].size == 0 || park["images"].size == 1)
        next
    else
    Park.create!(
        fullName: park["fullName"],
        state: park["states"],
        weatherInfo: park["weatherInfo"],
        description: park["description"],
        image: park["images"][1]["url"],
        url: park['url'],
        directionsInfo: park['directionsInfo'],
        # operatingHours: park['operatingHours'][0]['description'],
        # image2: park["images"][2]["url"],
        longitude: park['longitude'],
        latitude: park['latitude'],
        coverPic: park["images"][0]["url"],
        )
        end
    end
    
# get_parks  = RestClient.get "https://developer.nps.gov/api/v1/parks?fields=images&stateCode=#{state}&limit=20&api_key=PGrSGMlHp72bpbIjoHYqaSwtwErhyLrTswUbCbkD"
# parks_info = JSON.parse(get_parks)["data"]
# parks_info.each do |park|
#     if(park["images"].size < 2 )
#         next
#     elsif(park["weatherInfo"] == nil)
#         next
#       elsif(park["description"]== nil)
#         next
#     elsif(park["url"]== nil)
#         next
#     elsif(park["directionsInfo"]== nil)
#         next
#     elsif(park['operatingHours'][0]['description']== nil)
#         next
#     elsif(park["latitude"]== nil)
#         next
#     elsif(park["longitude"]== nil)
#         next
#     elsif(park["images"][0]['url'] == nil)
#         next
#     elsif(park["images"][1]['url'] == nil)
#         next
#     elsif(park["fullName"] == nil)
#         next
#     elsif(park["states"] == nil)
#         next
#     else
#         p park
#     Park.create!(
        

#         fullName: park["fullName"],
#         state: park["states"],
#         weatherInfo: park["weatherInfo"],
#         description: park["description"],
#         image: park["images"][1]["url"],
#         url: park['url'],
#         directionsInfo: park['directionsInfo'],
#         longitude: park['longitude'],
#         latitude: park['latitude'],
#         operatingHours: park['operatingHours'][0]['description'],
#         # image2: park["images"][2]["url"],
#         coverPic: park["images"][0]["url"],
#         )
#         end
#     end
end

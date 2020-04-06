class ParksController < ApplicationController
  require 'rest-client'

  def index
    parks = Park.all
    render json: parks.to_json(serializer)
  end
    
  def create 
    park = Park.create(strong_params)
    render json: park.to_json(serializer)
  end

  def search 

    parks = Park.all.select do |park|
      
      park[:fullName].downcase.include? params[:term].downcase

    end
    
    render json: parks.to_json

  end

  def homePark
      park = Park.all.sample
     

      render json: park.to_json
  end

  private

  def serializer
    {:except => [:created_at, :updated_at]}
  end

  def strong_params
    params.require(:park).permit(
      :name,
      :fullName,
      :url,
      :weatherInfo,
      :directionsInfo,
      :longitude,
      :latitude,
      :entranceFee,
      :operatingHours,
      :image,
      :image2,
      :image3,
      :description,
      :addresses,
      :coverPic,
      :state
    )

    
  end

end

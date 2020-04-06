class UsersParksController < ApplicationController

  def index
    joins = UsersPark.all
    render json: joins.to_json(serializer)
  end
    
  def create 
    
    user_park = UsersPark.create(user_id: params[:user_id], park_id: params[:park_id])
    
    render json: user_park.to_json(serializer)
  end

  def destroy
    join = UsersPark.find(params[:join][:id])
    join.destroy
    
    render json: join.to_json
  end

  private

  def serializer
    {:except => [:password, :created_at, :updated_at],
      include: {
        park: {
          except: [ :created_at, :updated_at]
        }
      }
  }     
 
 end

  def strong_params
    params.require(:user_park).permit(
      :user_id,
      :park_id
    )
  end
    
end

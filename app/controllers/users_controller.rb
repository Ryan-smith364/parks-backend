class UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json(serializer)
  end
    
  def create 
    user = User.create(strong_params)
    render json: user.to_json(serializer)
  end

  def update
      
    user = User.find(params[:id])
    
    user.update(
       username: params[:userObj][:username],
       email: params[:userObj][:email],
       first_name: params[:userObj][:first_name],
       last_name: params[:userObj][:last_name],
       password: params[:userObj][:password]
    )
    render json: user.to_json(serializer)
  end

  def login
    user = User.find_by(username: params[:username])

    if user
       
       render json: user.to_json(serializer)
    else
        render json: {
          error: true,
          message: "Incorrect User or password!"
        }
    end
  end

  private

  def serializer
   
        {:except => [:created_at, :updated_at],
        include: [
          users_parks: {
            except: [:created_at, :updated_at],
            include: [
              park: {
                except: [:created_at, :updated_at]
              }
            ]
          }
        ]
    }
  end

  def strong_params
    params.require(:user).permit(
     :first_name,
     :last_name,
     :username,
     :password,
     :email,
     :profile_picture
    )
  end
    
end

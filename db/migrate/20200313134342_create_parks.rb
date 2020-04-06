class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :fullName
      t.string :url
      t.string :weatherInfo
      t.string :directionsInfo
      t.string :longitude
      t.string :latitude
      t.string :entranceFee
      t.string :operatingHours
      t.string :image
      t.string :image2
      t.string :image3
      t.string :description
      t.string :addresses
      t.string :coverPic
      t.string :state
     

      t.timestamps
    end
  end
end

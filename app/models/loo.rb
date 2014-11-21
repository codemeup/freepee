class Loo < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  time1 = Time.now
  yyyy = time1.year.to_s
  mm = '%02d' % time1.month.to_s
  dd = '%02d' % time1.day.to_s
  @time2 = yyyy + mm + dd

  def self.foursquare(lat,lon)

      # We need to put client_secret somwhere else. Note that the Foursquare API
      # needs today's date as a parameter.
      client = Foursquare2::Client.new(:client_id => 'ZMGVY0FB55B1F1SGXZUULHJBJASPV4SPACNOQ4TF4BMYCWDG', :client_secret => '0OZJQ5KBQIE1ACR40RRJY2W3FB0ORXMN51GG25LA32ILWJX0', :api_version => @time2.to_s)

      # Note that the lat/long is hardcoded. Need to pass the parameters as strings
      # into the 'll' element below. Also Havent' figured out how to add "hotels"
      # as well.
      response = client.search_venues(:ll => '37.7749300,-122.4194200', :query => 'restaurants', :limit => 3)

      # Generates an array, loos, for use in loos list
      @loos = response.venues.map do |venue|
        {fs_id: venue.id, name: venue.name, address: venue.location.address, lat: venue.location.lat, long: venue.location.lng, postalCode: venue.location.postalCode, city: venue.location.city, state: venue.location.state, country: venue.location.country}
      end


      @local_loo = Loo.all.map do |loo|
        {id: loo.id, name: loo.name, address: loo.address, rating: loo.rating, key: loo.key, baby_changing: loo.baby_changing, handicapped: loo.handicapped, cost: loo.cost, stall: loo.stall, shower: loo.shower, toiletries: loo.toiletries, venue: loo.venue, user_id: loo.user_id}
      end

      @loo_results = @loos + @local_loo

      @loo_results
  end
end

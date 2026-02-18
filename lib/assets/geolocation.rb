class GeoLocation
  # 
  @@MIN_LAT = math.radians(-)
  @@MAX_LAT = math.radians()
  @@MIN_LON = math.radians(-)
  @@MAX_LON = math.radians()
  @@EARTH_RADIUS = 
  def self.from_degrees(cls, deg_lat, deg_lon)
    rad_lat = math.radians(deg_lat)
    rad_lon = math.radians(deg_lon)
    return GeoLocation.new(rad_lat, rad_lon, deg_lat, deg_lon)
  end
  def self.from_radians(cls, rad_lat, rad_lon)
    deg_lat = math.degrees(rad_lat)
    deg_lon = math.degrees(rad_lon)
    return GeoLocation.new(rad_lat, rad_lon, deg_lat, deg_lon)
  end
  def initialize(rad_lat, rad_lon, deg_lat, deg_lon)
    @rad_lat = rad_lat.to_f
    @rad_lon = rad_lon.to_f
    @deg_lat = deg_lat.to_f
    @deg_lon = deg_lon.to_f
    _check_bounds()
  end
  def to_s()
    degree_sign = 
    return .format(@deg_lat, @deg_lon, @rad_lat, @rad_lon)
  end
  def _check_bounds()
    if is_bool(@rad_lat < @@MIN_LAT || @rad_lat > @@MAX_LAT || @rad_lon < @@MIN_LON || @rad_lon > @@MAX_LON)
      raise Exception, 
    end
  end
  def distance_to(other, radius: EARTH_RADIUS)
    # 
    return radius * (math.acos((math.sin(@rad_lat) * math.sin(other.rad_lat)) + ((math.cos(@rad_lat) * math.cos(other.rad_lat)) * (math.cos(@rad_lon - other.rad_lon)))))
  end
  def bounding_locations(distance, radius: EARTH_RADIUS)
    # 
    if is_bool(radius <  || distance < )
      raise Exception, 
    end
    rad_dist = distance / radius.to_f
    min_lat = @rad_lat - rad_dist
    max_lat = @rad_lat + rad_dist
    if is_bool(min_lat > @@MIN_LAT && max_lat < @@MAX_LAT)
      delta_lon = math.asin(math.sin(rad_dist) / math.cos(@rad_lat).to_f)
      min_lon = @rad_lon - delta_lon
      if min_lon < @@MIN_LON
        min_lon +=  * math.pi
      end
      max_lon = @rad_lon + delta_lon
      if max_lon > @@MAX_LON
        max_lon -=  * math.pi
      end
    else
      min_lat = min_lat, @@MIN_LAT.max
      max_lat = max_lat, @@MAX_LAT.min
      min_lon = @@MIN_LON
      max_lon = @@MAX_LON
    end
    return [GeoLocation.from_radians(min_lat, min_lon), GeoLocation.from_radians(max_lat, max_lon)]
  end
  def self.MIN_LAT; @@MIN_LAT; end
  def self.MIN_LAT=(val); @@MIN_LAT=val; end
  def MIN_LAT; @MIN_LAT = @@MIN_LAT if @MIN_LAT.nil?; @MIN_LAT; end
  def MIN_LAT=(val); @MIN_LAT=val; end
  def self.MAX_LAT; @@MAX_LAT; end
  def self.MAX_LAT=(val); @@MAX_LAT=val; end
  def MAX_LAT; @MAX_LAT = @@MAX_LAT if @MAX_LAT.nil?; @MAX_LAT; end
  def MAX_LAT=(val); @MAX_LAT=val; end
  def self.MIN_LON; @@MIN_LON; end
  def self.MIN_LON=(val); @@MIN_LON=val; end
  def MIN_LON; @MIN_LON = @@MIN_LON if @MIN_LON.nil?; @MIN_LON; end
  def MIN_LON=(val); @MIN_LON=val; end
  def self.MAX_LON; @@MAX_LON; end
  def self.MAX_LON=(val); @@MAX_LON=val; end
  def MAX_LON; @MAX_LON = @@MAX_LON if @MAX_LON.nil?; @MAX_LON; end
  def MAX_LON=(val); @MAX_LON=val; end
  def self.EARTH_RADIUS; @@EARTH_RADIUS; end
  def self.EARTH_RADIUS=(val); @@EARTH_RADIUS=val; end
  def EARTH_RADIUS; @EARTH_RADIUS = @@EARTH_RADIUS if @EARTH_RADIUS.nil?; @EARTH_RADIUS; end
  def EARTH_RADIUS=(val); @EARTH_RADIUS=val; end
end
#if __name__ == 
#  loc1 = GeoLocation.from_degrees(, -)
#  loc2 = GeoLocation.from_radians(loc1.rad_lat, loc1.rad_lon)
#  raise unless loc1.rad_lat == loc2.rad_lat && loc1.rad_lon == loc2.rad_lon && loc1.deg_lat == loc2.deg_lat && loc1.deg_lon == loc2.deg_lon
#  loc1 = GeoLocation.from_degrees(, -)
#  loc2 = GeoLocation.from_degrees(, -)
#  raise unless loc1.distance_to(loc2) == loc2.distance_to(loc1)
#  loc = GeoLocation.from_degrees(, -)
#  distance = 
#  SW_loc,NE_loc = loc.bounding_locations(distance)
#  print(loc.distance_to(SW_loc))
#  print(loc.distance_to(NE_loc))
#end
#

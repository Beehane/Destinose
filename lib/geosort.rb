module GeoSort
  class Sorter # Essentially, I'm defining this class within this module to keep your
               # namespace clear of all the helper methods I use for the sorting logic

    R = 6371   # Radius of the Earth in km
    C = 40075  # Circumference of the Earth in km

    def nearestNeighbor(data)
      starts = corners(data)
      paths = []
      path_lengths = []

      for start in starts do
        array = data.dup()  # Make copy of array so I can freely use destructive methods
        array.delete(start)
        path = [start]
        path_length = []

        while array.any? do
          a = [path.last.latitude, path.last.longitude] # Take last point on the path as starting point
          distances = []

          for point in array do
            distances << d(a, [point.latitude, point.longitude]) # Distance between last point on path and every other point
          end

          min_d = distances.min # Find shortest distance
          card = array.slice!(distances.index(min_d))
          path.push(card)

          path_length << min_d
        end


        paths << path
        path_lengths << path_length.inject(:+)
      end

      paths[path_lengths.index(path_lengths.min)]
    end

    def corners(array)
      lats = array.map { |c| c.latitude  }
      lons = array.map { |c| c.longitude }
      lat_range = lats.max - lats.min
      lon_range = lons.max - lons.min

      if lat_range > lon_range # Figure out the axis along which points are most skewed
        return [array[lats.index(lats.max)], array[lats.index(lats.min)]]
      else
        return [array[lons.index(lons.max)], array[lons.index(lons.min)]]
      end
    end

    def d(p1, p2)
      u = p1.map {|angle| deg2rad(angle)}.unshift(R) # Convert array [lat, lon] to a spherical polar "vector" [r, theta, phi]
      v = p2.map {|angle| deg2rad(angle)}.unshift(R) # where theta and phi are angles in units of radians

      u = polar2rectangular(u) # Convert spherical polar vector [r, theta, phi] to cartesian [x, y, z]
      v = polar2rectangular(v)

      central_angle = Math::acos(dotProd(u, v)/R**2)  # Obtained from solving ux*vx + uy*vy + uz*vz = |u||v|cos(theta) for theta
      (central_angle/(2*Math::PI))*C                  # Arc length along a great circle
    end

    def deg2rad(deg)
      (Math::PI*deg)/180
    end

    def polar2rectangular(p)
      x = p[0]*Math::cos(p[1])*Math::cos(p[2]) # r*cos(phi)*cos(theta)
      y = p[0]*Math::cos(p[1])*Math::sin(p[2]) # r*cos(phi)*sin(theta)
      z = p[0]*Math::sin(p[1])                 # r*sin(phi)

      [x, y, z]
    end

    def dotProd(u, v)
      u[0]*v[0] + u[1]*v[1] + u[2]*v[2]
    end
  end

  def sort(data) # This is the method you care about and, in fact, the only one exposed by the module.
    s = Sorter.new()
    s.nearestNeighbor(data)
  end
end

include GeoSort

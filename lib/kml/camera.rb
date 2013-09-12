# <Camera id="ID">
#   <longitude></longitude>      <!-- kml:angle180 -->
#   <latitude></latitude>        <!-- kml:angle90 -->
#   <altitude>0</altitude>       <!-- double -->
#   <range></range>              <!-- double -->
#   <tilt>0</tilt>               <!-- float -->
#   <roll></roll>                <!-- float -->
#   <heading>0</heading>         <!-- float -->
#   <altitudeMode>clampToGround</altitudeMode>
#     <!--kml:altitudeModeEnum:clampToGround, relativeToGround, absolute -->
# </Camera>

module KML
  class Camera < KML::Object
    attr_accessor :longitude
    attr_accessor :latitude
    attr_accessor :altitude
    attr_accessor :range
    attr_accessor :tilt
    attr_accessor :roll
    attr_accessor :heading
    attr_accessor :altitude_mode

    def render(xm=Builder::XmlMarkup.new(:indent => 2))

      xm.Camera do
        [:longitude, :latitude, :altitude, :range, :tilt, :roll, :heading].each do |a|
          xm.__send__(a, self.__send__(a)) unless self.__send__(a).nil?
        end

        xm.__send__('gx:altitudeMode', self.altitude_mode) unless self.altitude_mode.nil?
      end
    end
  end
end
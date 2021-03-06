module KML
  class FlyTo < KML::Object
    attr_accessor :duration
    attr_accessor :fly_to_mode
    attr_accessor :feature

    def render(xm = Builder::XmlMarkup.new(indent: 2))
      xm.__send__('gx:FlyTo'.to_sym) do

        xm.__send__('gx:duration', self.duration)  unless self.duration.nil?
        xm.__send__('gx:flyToMode', self.fly_to_mode) unless self.fly_to_mode.nil?
        #xm.__send__(feature.class.name.split("::").last || "") do
        feature.render(xm) unless feature.nil?
        #end unless feature.nil?
      end
    end
  end
end
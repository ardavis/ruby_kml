module KML
  class Tour < Container
    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.__send__('gx:Tour'.to_sym) {
        super
        features.each { |f| f.render(xm) }
      }
    end
  end
end
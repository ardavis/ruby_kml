module KML
  class PhotoOverlay < Container
    def render(xm = Builder::XmlMarkup.new(indent: 2))
      xm.PhotoOverlay do
        super
        features.each { |f| f.render(xm) }
      end
    end
  end
end
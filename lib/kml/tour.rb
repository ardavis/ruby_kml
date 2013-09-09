module KML
  class Tour < Container
    def render(xm = Builder::XmlMarkup.new(indent: 2))
      xm.__send__('gx:Tour'.to_sym) do
        super
        xm.__send__('gx:Playlist'.to_sym) do
          features.each { |f| f.render(xm) }
        end
      end
    end
  end
end
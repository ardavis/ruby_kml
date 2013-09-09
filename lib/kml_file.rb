# The KMLFile class is the top level class for constructing KML files. To create a new KML file
# create a KMLFile instance and add KML objects to its objects. For example:
#
#   f = KMLFile.new
#   f.objects << Placemark.new(
#     :name => 'Simple placemark',
#     :description => 'Attached to the ground. Intelligently places itself at the height of the underlying terrain.',
#     :geometry => Point.new(:coordinates=>'-122.0822035425683,37.42228990140251,0')
#   )
#   puts f.render
class KMLFile
  attr_accessor :target
  attr_accessor :objects

  # The objects in the KML file
  def objects
    @objects ||= []
  end

  def hint
    if target == 'moon'
      'target=moon'
    else
      'target=earth'
    end
  end

  # Render the KML file
  def render(xm=Builder::XmlMarkup.new(:indent => 2))

    xm.instruct!
    xm.kml(xmlns: 'http://www.opengis.net/kml/2.2',
           'xmlns:gx' => 'http://www.google.com/kml/ext/2.2',
           'xmlns:kml' => 'http://www.opengis.net/kml/2.2',
           'xmlns:atom' => 'http://www.w3.org/2005/Atom',
           hint: hint) {
      objects.each { |o| o.render(xm) }
    }
  end

  def save filename
    File.open(filename, 'w') { |f| f.write render }
  end

end

require 'kml/object'

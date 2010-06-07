Facter.loadfacts

require 'pp'


class PkgInstall
  def self.map_packages(map)
    @@map_packages||={}
    map.each{|k,v|
      @@map_packages[k]=v
    }
  end
  
  def self.resolvePkgNames4(names)
    [names].flatten.map{|name|
      @@map_packages[name]
    }.flatten
  end
end

toload=
$LOAD_PATH.map{|path|
  d = File.expand_path('**/*.pkgrule',path)
  Dir[d]
}.flatten.uniq

toload.each{|$file|
  puts "Load file #{$file}"

  oldNames=PkgInstall.private_methods.sort
  class PkgInstall
    class << self
      load $file
    end
  end
  newNames=PkgInstall.private_methods.sort-oldNames
           
  newNames.each{|name|
    PkgInstall.public_class_method name
  }
}
$file=nil
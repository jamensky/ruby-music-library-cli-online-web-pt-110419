#require 'pry'


class Artist
 attr_accessor :name, :song

 @@all = []

 def initialize(name)
   @name = name
   @songs = []
   @@all << self
 end

 def songs
   @songs
 end

 def self.all
   @@all
 end

 def self.destroy_all
   @@all.clear
 end

 def save
   @@all << self
 end

 def self.create(name)
   self.new(name)
 end

 def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
 end

 def genres
   genres = []
   self.songs.collect{|song| genres << song.genre }
   genres.uniq
 end

end

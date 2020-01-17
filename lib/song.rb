#require_relative './lib/artist.rb'
require 'pry'
class Song
 attr_accessor :name, :artist, :genre

 @@all = []

 def initialize(name, artist = nil, genre = nil)
   @name = name
   @genre = genre
   self.artist=(artist) if artist
   self.genre=(genre) if genre
   @@all << self
 end

 def self.destroy_all
   @@all.clear
 end

 def self.all
   @@all
 end

 def save
   @@all << self
 end

 def self.create(name)
   self.new(name)
 end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
 end

 def genre=(genre)
   @genre = genre unless genre.songs.include?(self)
   @genre.songs << self unless @genre.songs.include?(self)
 end

 def self.find_by_name(name)
    self.all.select{|song| return song if song.name == name}
 end

 def self.find_or_create_by_name(name)
   if self.find_by_name(name)
      self.find_by_name(name)
   else
      self.create(name)
     binding.pry
   end
 end

end

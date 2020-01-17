require 'pry'

class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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

  def artists
    artists = []
    self.songs.collect{|song| artists << song.artist if song.genre == self}
    artists.uniq
  end

 end

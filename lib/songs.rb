require_relative './parent.rb'

class Song < Parent
  attr_accessor :artist
  
  def initialize(name, artist = nil)
    super(name)
    @artist = artist
    @artist.songs << self
    
  end
  
  
end
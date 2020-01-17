
=begin

def initialize(name)
  @name = name
  self.class.all << self
end

def create(name)
  self.new(name)
end

def destroy_all
   self.all.clear
end

def save
  self.class.all << self
end
=end 

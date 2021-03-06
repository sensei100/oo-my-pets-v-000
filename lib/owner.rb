class Owner

  @@all = []

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(species)
    @@all << self
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.length
  end

   def self.reset_all
    @@all = []
  end

  def say_species
   "I am a #{species}."
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    all_pets = @pets.values
    all_pets.each { |animals|
      animals.each { |pet| pet.mood = "nervous" }} 
  
    @pets.values.each { |pet| pet.clear }
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
    
  end
end
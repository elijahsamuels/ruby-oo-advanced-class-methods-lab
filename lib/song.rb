class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end


  def save
    self.class.all << self
  end


  # instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song

  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}

  end

  # invokes .find_by_name and .create_by_name instead of repeating code
  # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  # creates a new Song object with the provided title if one doesn't already exist  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
    # This block (below) works too, but isn't as efficient.
      # if self.find_by_name(name)  # invokes .find_by_name and .create_by_name instead of repeating code
      #   self.find_by_name(name)   # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
      # else
      #   self.create_by_name(name) #creates a new Song object with the provided title if one doesn't already exist
      # end
  def self.alphabetical

    @@all.sort{ |a,b| a.name <=> b.name }
    # @@all.sort_by{ |song| song.name } # This way is way better. 

  end

  def self.new_from_filename(filename)
      split_filename = filename.chop.chop.chop.chop.split(" - ")
      song = Song.new
      song.name = split_filename[1]
      song.artist_name = split_filename[0]
      song
  
  end

  def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song

  end

  def self.destroy_all
    @@all.clear
  end


end




# Build a class constructor Song.create that initializes a song and saves it to the @@all class variable either literally or through the class method Song.all. This method should return the song instance that was initialized and saved.


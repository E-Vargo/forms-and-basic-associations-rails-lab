class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(array)
    array.each do |a|
      a != "" ? self.notes << Note.create(content: a) : nil
    end
  end

  def note_contents
    self.notes.collect do |n, i|
      "#{n.content}#{i}"
    end
  end

end

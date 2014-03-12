class Term
  @@whole_dictionary = []
  # attr_reader :word, :definition

  def Term.all
    @@whole_dictionary
  end

  def Term.clear
    @@whole_dictionary = []
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def edit(word, definition)
    @word = word
    @definition = definition
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def save
    @@whole_dictionary << self
  end

  # def search(search_word)
  #   @search_word = search_word
  #   Term.all.each do |term|
  #   if search_word == term.word
  #     term.word
  #   end
  # end
end



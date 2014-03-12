class Term
  @@whole_dictionary = []
  attr_reader :word, :definition

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

  def save
    @@whole_dictionary << self
  end

  def Term.search(search_word)
    search_result = Term.all.select { |term| search_word == term.word }
    search_result[0]
  end
end

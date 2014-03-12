require 'rspec'
require 'dictionary'

describe Term do
  before do
    Term.clear
  end

  it 'is initialized with a word and definition' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.should be_an_instance_of Term
  end

  describe '.all' do
    it 'is empty at first' do
      Term.all.should eq []
    end
  end

  describe '.create' do
    it 'makes a new instances of Term' do
      test_term = Term.create('headphones', 'personal speakers')
      test_term.should be_an_instance_of Term
    end

    it 'saves new terms' do
      test_term = Term.create('headphones', 'personal speakers')
      Term.all.should eq [test_term]
    end
  end

  describe '.clear' do
    it 'empties out all the saved terms' do
      Term.new('cup', 'holds liquids').save
      Term.clear
      Term.all.should eq []
    end
  end

  # describe '.search' do
  #   it 'allows the user to search for a specific term' do
  #     test_term = Term.create('carrot', 'veggie')
  #     Term.search('carrot').should eq test_term
  #   end
  # end
end

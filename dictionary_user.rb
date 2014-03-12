require './lib/dictionary'



def main_menu

  puts "Press 'a' to add a new term"
  puts "Press 'd' to delete an exisiting term"
  puts "Press 'e' to edit an existing term"
  puts "Press 'l' to list all terms"
  puts "Press 'x' to exit"

  main_choice = gets.chomp

  case main_choice
  when 'a'
    add_term
  when 'd'
    delete_term
  when 'e'
    edit_term
  when 'l'
    list_terms
  when 'x'
    puts "Goodbye!"
  else
    puts "Please enter a valid option"
    main_menu
  end
end

def add_term
  puts "Enter a word:"
  word = gets.chomp
  puts "Enter the definition:"
  defintion = gets.chomp
  Term.create(word, defintion)
  puts "Task added. \n\n"
  main_menu
end

def list_terms
  puts "Here is a list of your terms:"
  Term.all.each do |term|
    puts "#{term.word}: #{term.definition} \n\n"
  end
  main_menu
end

def delete_term
  puts "Put the number of the term you would like to delete \n"
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word}: #{term.definition} \n\n"
  end
  selected_term = gets.chomp.to_i
  Term.all.delete(Term.all[selected_term -1])
  puts "Term has been deleted successfully \n\n"
  main_menu
end

def edit_term

  puts "Put the number of the term you would like to edit \n"
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word}: #{term.definition} \n\n"
  end
  selected_term = gets.chomp.to_i

  puts "Press 'w' to update the word"
  puts "Press 'd' to update the definition"
  puts "Press 'm' to go to the main menu"
  puts "Press 'x' to exit"
  updated_choice = gets.chomp

  case updated_choice
  when 'w'
    puts "Enter updated word"
    updated_word = gets.chomp
    Term.all[selected_term - 1].edit(updated_word, Term.all[selected_term - 1].definition)
    edit_term
  when 'd'
    puts "Enter updated definition"
    updated_definition = gets.chomp
    Term.all[selected_term - 1].edit(Term.all[selected_term - 1].word, updated_definition)
    edit_term
  when 'm'
    main_menu
  when 'x'
    puts "Bye"
  else
    puts "Please enter a valid option \n\n"
    edit_term
  end
end
main_menu

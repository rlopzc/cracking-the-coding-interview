module Trie
  class Node
    attr_reader :childs
    attr_accessor :symbol

    def initialize
      @childs = []
    end

    def insert(word)
      #Obtenemos todas las letras
      if word.empty?
        return true
      else
        letter = word.split('').map(&:to_sym).first

        #Empzamos a comparar las letras con los simbolos en los hijos que tenemos
        child = @childs.find {|node| node.symbol == letter}
        if child
          child.insert(word[1..-1])
        else
          new_child = Node.new
          new_child.symbol = letter
          self.childs << new_child
          new_child.insert(word[1..-1])
        end
        #Si no existe ningun simbolo que haga match, entonces se crea un hijo con
        # ese simbolo, posteriormente se selecciona y se llama recursivamente hasta
        # haber agregado toda la palabra
      end
    end

    def include?(word)
      if word.empty?
        return true
      else
        letter = word.split('').map(&:to_sym).first
        child = @childs.find { |node| node.symbol == letter}
        if child
          child.include?(word[1..-1])
        else
          return false
        end
      end
    end

  end
end

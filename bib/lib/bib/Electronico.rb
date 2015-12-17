require './lib/bib.rb'
include Bib

class Electronico < Biblio
    
        attr_reader :tipo, :size
        attr_accessor :tipo, :size
        
        def initialize(tipo, size)
            @tipo = tipo
            @size = size
        end
        
end
require './lib/bib.rb'
include Bib

class Revista < Biblio
    
     attr_reader :nom_revista, :cant_pag, :num_publicacion
     attr_accessor :nom_revista, :cant_pag, :num_publicacion
        
        def initialize(nom_revista, cant_pag, num_publicacion)
           @nom_revista = nom_revista
           @cant_pag = cant_pag
           @num_publicacion = num_publicacion
        end
    
end
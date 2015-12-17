require './lib/bib.rb'
include Bib

class Periodico < Biblio
        
     attr_reader :nom_periodico, :seccion, :num_pag
        attr_accessor :nom_periodico, :seccion, :num_pag
        
        def initialize(nom_periodico, seccion, num_pag)
           @nom_periodico = nom_periodico
           @seccion = seccion
           @num_pag = num_pag
        end
     
end
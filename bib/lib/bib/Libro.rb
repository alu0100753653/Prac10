require './lib/bib.rb'
include Bib

class Libro < Biblio
    
        def initialize(autores,apellidos,titulo, fecha, serie = nil,edicion, numeroedicion, isbn)
            @autores = autores
            @apellidos = apellidos
            @titulo = titulo
            @fechapublicacion = fechapublicacion
            @serie = serie
            @edicion = edicion
            @numeroedicion = numeroedicion
            @isbn = isbn
        end
       
        def <=> other
	     @titulo <=> other.titulo
        end
	   
	   def ==(other)
	      @titulo == other.titulo
	   end
       
       
end
require './lib/bib/Lista.rb'

class Apa
    
        attr_accessor :lista1, :lista2,:lista
        
        def initialize(lista)
                @lista1 = lista
                @lista2 = Lista.new
        end
        
        
        #Nombres y apellidos.
        
        def nombre(other)
            i = 0
            if(other.autores.length > 1)
                while (i<other.autores.length-2)
                    nombre = "#{nombre}"+"#{other.apellidos[i]}," + "#{other.autores[i][0]}.,"
                    i = i+1
                end
                nombre = "#{nombre}"+"#{other.apellidos[i]}," + "#{other.autores[i][0]}. &"
                i = i+1
            end
            nombre = "#{nombre}"+"#{other.apellidos[i]}," + "#{other.autores[i][0]}."
        end
        
        #listas.
        
        def sort
            #@lista1.insertar_f(other)
            @lista2 = lista1.sort
        end
        
        #Formateado y sangria.
        
        def imprimir (other)
             size = @lista2.length
             i=0
            while(i<size)
        		cadena = "#{nombre(lista2[i])}\n   "
        		cadena = "#{cadena}"+"#{lista2[i].titulo}\n   "
        		cadena = "#{cadena}"+"(#{lista2[i].serie})\n   "
        		cadena = "#{cadena}"+"#{lista2[i].edicion}; edition (#{lista2[i].getfecha})\n   "
                cadena = "#{cadena}"+"#{lista2[i].getisbn}\n"
        		i = i+1
            end
    		cadena = cadena[0..-2]
        end
        
end
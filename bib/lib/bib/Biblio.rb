class Biblio
        include Comparable
       
        attr_reader :autores,:apellidos, :titulo, :fechapublicacion, :serie, :edicion ,:numeroedicion, :isbm  
        
        def initialize(autores,apellidos, titulo, fechapublicacion, serie, edicion,numeroedicion,isbn)
            @autores = autores
            @apellidos = apellidos
            @titulo = titulo
            @fechapublicacion = fechapublicacion
            @serie = serie
            @edicion = edicion
            @numeroedicion = numeroedicion
            @isbn = isbn
        end
        
        def to_s
          "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}\n#{@apellidos}"
        end
       
        def <=>(other)
			if(@apellidos != other.apellidos)
				@apellidos <=> other.apellidos
			else
				if(@fechapublicacion != other.fechapublicacion)
					@fechapublicacion <=> other.fechapublicacion
				else
					@titulo <=> other.titulo
				end
			end
		end
		
		def getautores()
			tam = @autores.length
			i, j = 0
			while i < (tam - 1)
				cadena = "#{cadena}"+"#{@autores[i]} #{@apellidos[i]}, "
				i = i+1
				j = j+1
			end
			cadena = "#{cadena}"+"#{@autores[i]} #{@apellidos[i]}"
		end
		
		def gettitulo()
			"#{@titulo}"
		end


        def getedicion()
			"#{@edicion}"
	    end

		def getnumeroedicion()
			"#{@numeroedicion}"
		end

		def getserie()
			"#{@serie}"
		end

		def getisbn()
			tam = @isbn.length
			a = @isbn[0].length
			cadena = "ISBN-#{a}: "
			if a > 10
				cadena = "#{cadena}" + "#{@isbn[0][-a..-11]}" + " - " + "#{@isbn[0][-10..-1]}"
			else
				cadena = "#{cadena}"+"#{@isbn[0]}"
			end
			i = 1
		end

		def getfecha()
			"#{@fechapublicacion}"
		end

		def to_s(valor)
			"#{@valor}"
		end
		
		
end
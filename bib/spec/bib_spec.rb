require './lib/bib.rb'
require './lib/bib/Biblio.rb'
require './lib/bib/Lista.rb'
require './lib/bib/Apa.rb'
require './lib/bib/Libro.rb'
require './lib/bib/Revista.rb'
require './lib/bib/Electronico.rb'
require './lib/bib/Periodico.rb'

include Bib

    
describe Bib do 
    before :each do 
    	  @libro1 =Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	  @libro2 =Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2015','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	  @libro3 =Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	  @libro4 =Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	
    	@list=Lista.new
    	
    	#@list.insertar_i(@libro2)
    	

    end

    describe 'Citas de la APA' do
		it "Nombres invertidos " do
			expect(@fapa.nombre(@libro1)).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end	
		it "Orden de entrada correcto" do
			@list.insertar_i(@libro1)
			@list.insertar_i(@libro3)
			@fapa =Apa.new(@list)
			@fapa.sort
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
			expect(@fapa.nombre(@fapa.lista2[1])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end

		it "Ordena por fecha de publicacion (Cuando autor es el mismo)" do
			@list.insertar_i(@libro1)
			@list.insertar_i(@libro3)
			@list.insertar_i(@libro4)
			@fapa=Apa.new(@list)
			@fapa.sort
			expect(@fapa.lista2[1].fechapublicacion).to eq('4 July 2013')
		end

		it "Si un autor aparece solo y el primero de un grupo (lse lista primero las entradas de un autor)." do
			@list.insertar_i(@libro1)
			@list.insertar_i(@libro3)
			@fapa=Apa.new(@list)
			@fapa.sort
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end

		it "Mismos autores y el misma fecha de publicacion" do
			@list.insertar_i(@libro1)
			@list.insertar_i(@libro3)
			@fapa=Apa.new(@list)
			@fapa.sort
			expect(@fapa.lista2[0].titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide")
		end

		it "Utilizar & en lugar de 'y' o de 'and'" do
			@list.insertar_i(@libro1)
			@fapa=Apa.new(@list)
			@fapa.sort
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end
		it "Sangría Francesa" do
			@list.insertar_i(@libro1)
			@fapa=Apa.new(@list)
			@fapa.sort
			expect(@fapa.imprimir(@libro1)).to eq("Thomas,D.,Hunt,A. &Fowler,C.\n   Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\n   (2323)\n   Pragmatic Bookshelf; edition (4 July 2013)\n   1")
		end
	end


end
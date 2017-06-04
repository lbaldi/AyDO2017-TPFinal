require 'rspec' 
require_relative '../model/calendario'
require_relative '../model/evento'

describe 'Calendario' do

	let (:calendario) {Calendario.new("Laboral")}

	it "Si creo un calendario de nombre Laboral tengo que obtenerlo" do
		expect(calendario.nombre).to eq 'Laboral'
	end

	it "agregar 1 evento a calendario sin eventos deberia devolver cantidad de eventos = 1 " do
		evento = Evento.new(Time.now, Time.now, "AyDoo", calendario)
		calendario.agregarEvento(evento)

		expect(calendario.eventos.size).to eq 1
	end

end
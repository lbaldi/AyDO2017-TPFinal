require_relative '../model/repositorioCalendarios'
require 'json'

class PersistidorDeDatos

	attr_accessor :path_calendarios

	def initialize
		self.path_calendarios = "../calendarios/"
	end

	def guardarDatosRepositorioCalendarios(repositorioCalendarios)
		repositorioCalendarios.calendarios.values.each do |calendario|
			File.open("#{path_calendarios}#{calendario.nombre}.txt", 'w') do |file|
				calendario.eventos.values.each do |evento| 
					json_string = evento.obtenerJsonString
					file.puts(json_string.to_json) 
				end
			end
		end
	end

	def cargarDatosCalendarios(repositorioCalendarios)
		Dir.glob("#{path_calendarios}*").each do |fullNameFile|
			nameFile = fullNameFile.gsub('../calendarios/', '')
			calendario = repositorioCalendarios.crearCalendario(nameFile.gsub('.txt',''))

			File.open("#{path_calendarios}#{nameFile}", 'r') do |file|				
				while (line = file.gets)					
				    json = JSON.parse(line)

				    calendario.crearEvento(json['id_evento'], json['fecha_inicio'], json['fecha_fin'])				    
				end
			end
		end

		return repositorioCalendarios
	end
end
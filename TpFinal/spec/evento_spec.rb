require 'rspec'
require_relative '../model/evento'
require_relative '../model/calendario'

describe 'Evento' do

  it 'Se debe crear un evento a partir de un id, nombre, inicio y fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    Evento.new(id, nombre, inicio, fin)
  end

  it 'Deberia poder obtener el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.id).to eq id
  end

  it 'Error al intentar modificar el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect {evento.id = 'nuevo_id'}.to raise_error
  end

  it 'Deberia poder obtener el nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.nombre).to eq nombre
  end

  it 'Deberia poder obtener el inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.inicio).to eq inicio
  end

  it 'Deberia poder obtener el fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.fin).to eq fin
  end

  it 'Deberia poder obtener el intervalo del evento' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.obtener_intervalo).to eq inicio..fin
  end

  it 'Deberia poder modificar su nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_nombre = 'nuevo_nombre'
    evento.nombre = nuevo_nombre
    expect(evento.nombre).to eq nuevo_nombre
  end

  it 'Deberia poder modificar su inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    un_dia = 1
    nuevo_inicio = inicio - un_dia
    evento.inicio = nuevo_inicio
  end

  it 'Deberia poder modificar su fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    un_dia = 1
    nuevo_fin = fin + un_dia
    evento.fin = nuevo_fin
  end

  it 'Error al crear un evento con fin menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    un_dia = 1
    fin = inicio - un_dia
    expect do
      Evento.new(id, nombre, inicio, fin)
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar fin y que fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    un_dia = 1
    nuevo_fin = inicio - un_dia
    expect do
      evento.fin = nuevo_fin
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar inicio y que fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    un_dia = 1
    nuevo_inicio = inicio + un_dia
    expect do
      evento.inicio = nuevo_inicio
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar inicio e intervalo supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    tres_dias = 3
    nuevo_inicio = inicio - tres_dias
    expect do
      evento.inicio = nuevo_inicio
    end.to raise_error(ExcepcionIntervaloMaximo)
  end

  it 'Error al modificar fin e intervalo supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    tres_dias = 3
    nuevo_fin = inicio + tres_dias
    expect do
      evento.fin = nuevo_fin
    end.to raise_error(ExcepcionIntervaloMaximo)
  end

  it 'Deberia poder modificar fin e intervalo no supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    casi_tres_dias = 2.99
    nuevo_fin = inicio + casi_tres_dias
    evento.fin = nuevo_fin
  end

  it 'Deberia poder modificar inicio e intervalo no supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    casi_tres_dias = 2.99
    nuevo_inicio = inicio - casi_tres_dias
    evento.inicio = nuevo_inicio
  end
end
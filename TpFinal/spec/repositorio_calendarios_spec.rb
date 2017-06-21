require 'rspec'
require_relative '../model/repositorio_calendarios'

describe 'Repositorio Calendarios' do
  it 'Debe poder almacenar un calendario' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    repositorio.agregar_calendario(calendario)
  end

  it 'Debe poder almacenar varios calendarios' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('Calendario 2')
    allow(otro_calendario).to receive(:nombre).and_return('Calendario 2')
    repositorio = RepositorioCalendarios.new
    repositorio.agregar_calendario(calendario)
    repositorio.agregar_calendario(otro_calendario)
  end

  # En este caso la identificacion es la misma
  # y los nombres de calendario son iguales
  it 'Error al almacenar un calendario con una identificacion ya almacenada' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('Calendario 1')
    allow(otro_calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    repositorio.agregar_calendario(calendario)
    expect do
      repositorio.agregar_calendario(otro_calendario)
    end.to raise_error(ExcepcionUnicidadCalendario)
  end

  # En este caso la identificacion es la misma
  # pero los nombres de los calendarios son diferentes
  it 'Error al almacenar un calendario con una identificacion ya almacenada' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('cAlEndArio 1')
    allow(otro_calendario).to receive(:nombre).and_return('cAlEndArio 1')
    repositorio = RepositorioCalendarios.new
    repositorio.agregar_calendario(calendario)
    expect do
      repositorio.agregar_calendario(otro_calendario)
    end.to raise_error(ExcepcionUnicidadCalendario)
  end

  it 'Deberia poder obtener un calendario existente' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    calendario = repositorio.agregar_calendario(calendario)
    expect(repositorio.obtener_calendario(calendario.nombre)).to eq calendario
  end

  it 'Error al obtener un calendario inexistente' do
    repositorio = RepositorioCalendarios.new
    expect do
      repositorio.obtener_calendario('inexistente')
    end.to raise_error(ExcepcionCalendarioInexistente)
  end

  it 'Deberia poder eliminar un calendario existente' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    calendario = repositorio.agregar_calendario(calendario)
    repositorio.eliminar_calendario(calendario.nombre)
  end

  it 'Error al eliminar un calendario inexistente' do
    repositorio = RepositorioCalendarios.new
    expect do
      repositorio.eliminar_calendario('inexistente')
    end.to raise_error(ExcepcionCalendarioInexistente)
  end
end
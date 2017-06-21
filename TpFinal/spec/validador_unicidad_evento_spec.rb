require 'rspec'
require_relative '../model/validador_unicidad_evento'

describe 'Validador Unicidad Evento' do
  let(:validador) {ValidadorUnicidadEvento.new}

  it 'Deberia validar un id en un repositorio sin calendarios' do
    evento = double('Evento')
    allow(evento).to receive(:id).and_return('id_1')
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({})
    validador.validar(repositorio, evento.id)
  end

  it 'Deberia validar un id en un repositorio con un calendario sin eventos' do
    evento = double('Evento')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = double('Calendario')
    allow(calendario).to receive(:eventos).and_return({})
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({id: calendario})
    validador.validar(repositorio, evento.id)
  end

  it 'Error al validar un id existente' do
    evento = double('Evento')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = double('Calendario')
    allow(calendario).to receive(:eventos).and_return({'id_1' => evento})
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({id: calendario})
    expect do
      validador.validar(repositorio, evento.id)
    end.to raise_error(ExcepcionUnicidadGlobalEvento)
  end
end
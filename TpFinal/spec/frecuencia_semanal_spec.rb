require 'rspec'
require_relative '../model/frecuencia_semanal'

describe 'Frecuencia Semanal' do
  it 'deberia devolver 7 al pedirle la frecuencia' do
    expect(FrecuenciaSemanal.new.periodo_repeticion).to eq 7
  end
end
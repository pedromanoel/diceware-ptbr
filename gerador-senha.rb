#!/usr/bin/env ruby -w

def run!

  arquivo = 'dicionario-pt.txt'
  palavras = []

  File.foreach(arquivo) do |linha|

    if linha.length >= 5
      palavras << linha.strip.capitalize
    end

  end

  gerador = GeradorXkcd.new palavras
  puts gerador.obter_senha
end


class GeradorXkcd

  def initialize(palavras, tamanho: 4)
    @palavras = palavras
    @tamanho = tamanho
  end


  def obter_senha
    @palavras.sample(@tamanho).join(" ")
  end

end

run! if __FILE__ == $PROGRAM_NAME

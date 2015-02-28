require "test/unit"
require "./gerador-senha"

class GeradorXkcdTest < Test::Unit::TestCase

  def setup
    @palavras = %w[um dois tres quatro cinco seis sete oito nove dez]
  end
  

  def test_obter_senha_normal

    gerador = GeradorXkcd.new @palavras
    palavras_senha = gerador.obter_senha.split " "

    assert_equal palavras_senha.length, 4
    assert_subset @palavras, palavras_senha

  end


  def test_obter_senha_poucas_palavras

    gerador = GeradorXkcd.new @palavras[0..2]
    palavras_senha = gerador.obter_senha.split " "

    assert_equal palavras_senha.length, 3
    assert_subset(@palavras, palavras_senha)

  end


  def assert_subset(superset, subset)

    subset.each do |palavra|
      assert_include superset, palavra
    end

  end

end

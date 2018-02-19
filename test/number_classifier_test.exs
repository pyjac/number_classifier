defmodule NumberClassifierTest do
  use ExUnit.Case
  doctest NumberClassifier

  test "isPerfect" do
    assert NumberClassifier.isPerfect(6)
    refute NumberClassifier.isPerfect(4)
    assert NumberClassifier.isPerfect(496)
    refute NumberClassifier.isPerfect(100)
    assert NumberClassifier.isPerfect(8128)
  end

  test "isAbundant" do
    assert NumberClassifier.isAbundant(12)
    refute NumberClassifier.isAbundant(43)
    assert NumberClassifier.isAbundant(18)
    refute NumberClassifier.isAbundant(101)
    assert NumberClassifier.isAbundant(20)
  end

  test "isDeficient" do
    assert NumberClassifier.isDeficient(1)
    refute NumberClassifier.isDeficient(6)
    assert NumberClassifier.isDeficient(11)
    refute NumberClassifier.isDeficient(12)
    assert NumberClassifier.isDeficient(21)
  end
end

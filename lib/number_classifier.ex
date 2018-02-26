defmodule NumberClassifier do
  def isFactor(number, potential_factor) do 
    rem(number, potential_factor) == 0
  end

  # First Implementation
  def factors(number, i, sq_number, acc) when i <= sq_number do
    cond do 
      isFactor(number, i) -> factors(number, i + 1, sq_number, acc |> MapSet.put(i) |> MapSet.put(div(number, i)))
      true -> factors(number, i + 1, sq_number, acc)
    end 
  end

  def factors(_, i, sq_number, acc) when i > sq_number do
    acc
  end


  # Second Implementation
  def factors2(number) do
    result = for n <- 1..trunc(:math.sqrt(number)), isFactor(number, n), do: [n, div(number, n)]
    result 
    |> List.flatten
    |> MapSet.new
  end


  def isPerfect(number) do
    sum_factors(number) - number == number
  end

  def sum_factors(number) do 
    number
      |> factors2
      |> Enum.sum
  end

  def isAbundant(number) do
    sum_factors(number) - number > number
  end

  def isDeficient(number) do 
    sum_factors(number) - number < number;
  end
end



# public class NumberClassifier {
 
#     static public boolean isFactor(int number, int potential_factor) {
#         return number % potential_factor == 0;
#     }
 
#     static public Set<Integer> factors(int number) {
#         HashSet<Integer> factors = new HashSet<Integer>();
#         for (int i = 1; i <= sqrt(number); i++)
#             if (isFactor(number, i)) {
#                 factors.add(i);
#                 factors.add(number / i);
#             }
#         return factors;
#     }
 
#     static public int sum(Set<Integer> factors) {
#         Iterator it = factors.iterator();
#         int sum = 0;
#         while (it.hasNext())
#             sum += (Integer) it.next();
#         return sum;
#     }
 
#     static public boolean isPerfect(int number) {
#         return sum(factors(number)) - number == number;
#     }
 
#     static public boolean isAbundant(int number) {
#         return sum(factors(number)) - number > number;
#     }
 
#     static public boolean isDeficient(int number) {
#         return sum(factors(number)) - number < number;
#     }
# }

# isFactor = fn(number, potential_factor) do rem(number, potential_factor) == 0 end

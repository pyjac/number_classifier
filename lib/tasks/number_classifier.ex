defmodule Mix.Tasks.NumberClassifier do
    use Mix.Task
    def run(_) do
        NumberClassifier.isPerfect(6) |> IO.inspect
    end
end
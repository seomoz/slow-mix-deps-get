Code.require_file "mix_common.exs", __DIR__

defmodule Delorean.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.parent_project(
      apps_path: "apps",
      test_paths: test_paths(),
      short_deps: short_deps()
    )
  end

  # Specifies deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      {:dialyxir, :external, only: [:dev, :test]},
      {:ex_doc, :external, only: :dev},
      {:earmark, :external, only: :dev},
    ]
  end

  defp test_paths do
    "apps/*/test" |> Path.wildcard |> Enum.sort
  end
end

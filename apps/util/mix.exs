Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.Util.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :util,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      {:ex_json_schema, :external},
      {:exrm, :external, runtime: false},
      {:poison, :external},
      {:timex, :external},

      {:benchfella, :external, only: :dev},
      {:quixir, :external, only: :test},
    ]
  end
end

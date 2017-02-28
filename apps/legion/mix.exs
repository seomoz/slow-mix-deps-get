Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.Legion.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :legion,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application(mod: {Delorean.Legion, []})
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :common_models,
      :runtime_config,
      :util,
      :worker_pool,
      {:ecto, :external},
      {:mariaex, :external},

      {:timex, :external}, # only: :test
      {:process_tree_dictionary, :external, only: :test},
    ]
  end
end


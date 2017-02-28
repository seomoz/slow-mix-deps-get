Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.S3.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :s3,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :runtime_config,
      :util,
      {:ex_aws, :external},
      {:exvcr, :external, only: :test, runtime: false},
      {:httpoison, :external},
      {:poison, :external}, # ex_aws depends on it, but does not list as a dependency
      {:process_tree_dictionary, :external, only: :test},
      {:sweet_xml, :external},
    ]
  end
end

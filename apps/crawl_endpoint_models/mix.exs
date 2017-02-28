Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.CrawlEndpointModels.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      mod: {Delorean.CrawlEndpointModels, []},
      app: :crawl_endpoint_models,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :crawl_models,
      :runtime_config,
      :shard_repository,
      {:benchfella, :external, only: :dev},
      {:csv, :external}, # only: :test
    ]
  end
end

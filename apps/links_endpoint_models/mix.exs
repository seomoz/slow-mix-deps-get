Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.LinksEndpointModels.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :links_endpoint_models,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :common_models,
      :legion,
      :links_models,
      :shard,
      :shard_repository,
      :util,
    ]
  end
end

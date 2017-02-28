Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.RankingsEndpointModels.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :rankings_endpoint_models,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :barbosa_client,
      :common_models,
      :legion,
      :legion_api_client,
      :links_models,
      :on_page_models,
      :rankings_models,
      :search_volume_models,
      :shard_repository,
      :util,
      :worker_pool,

      # We use this in tests to help build a shard.
      {:rankings_builder, only: :test},
      {:process_tree_dictionary, :external, only: :test},
      {:csv, :external}, # only: :test
      {:timex, :external}, # only: :test
    ]
  end
end

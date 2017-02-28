Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.OnPageBuilder.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :on_page_builder,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :build_manager_core,
      :common_models,
      :legion,
      :on_page_models,
      :packrat_snapshot_repository,
      :shard_storage,
      :util,
      :worker_pool,

      {:process_tree_dictionary, :external, only: :test},
    ]
  end
end

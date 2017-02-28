Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.BuildManagerCore.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :build_manager_core,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application()
  end

  defp short_deps do
    [
      :common_models,
      :legion,
      :packrat_snapshot_repository,
      :runtime_config,
      :s3,
      :shard,
      :shard_storage,
      :worker_pool,

      {:process_tree_dictionary, :external, only: :test},
    ]
  end
end


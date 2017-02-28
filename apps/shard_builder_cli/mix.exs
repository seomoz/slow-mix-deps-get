Code.require_file "../../mix_common.exs", __DIR__

defmodule ShardBuilderCLI.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :shard_builder_cli,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :build_manager_core,
      :error_reporter,
      :shard_update_list_generator,
      :runtime_config,
      :search_volume_builder,
      :shard_builder,
      :shard_storage,
      :statsd,
      :util,
      {:exrm, :external, runtime: false},
      {:ex_syslogger, :external},
      {:campaign_status},           # only: :test
      {:legion},                    # only: :test
      {:packrat_snapshot_repository}, # only: :test
    ]
  end
end

Code.require_file "../../mix_common.exs", __DIR__

defmodule ShardBuilderCLI.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :shard_builder_cli,
      per_app_prod_config: Path.expand("config/per_app_prod_config.exs", __DIR__),
      short_deps: short_deps())
  end

  def application do
    app_settings_for(Mix.env)
    |> Delorean.MixCommon.child_application()
  end

  # This has to be started in prod to ensure `build_manager_core` gets
  # started, but in tests `builder_manager_core` is started explicitly
  # to be compatible with ProcessTreeDictionary, and in the dev environment
  # it cannot start because `build_manager` starts `build_manager_core`
  # and gets a conflict.
  defp app_settings_for(:prod) do
    [mod: {Delorean.ShardBuilderCLI.Application, []}]
  end
  defp app_settings_for(_), do: []

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

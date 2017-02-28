Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.BuildManager.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :build_manager,
      per_app_prod_config: Path.expand("config/per_app_prod_config.exs", __DIR__),
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    app_settings_for(Mix.env)
    |> Delorean.MixCommon.child_application()
  end

  # We don't want this app started automatically in tests.
  # Every test that needs it is responsible for starting it
  # so that it plays well with ProcessTreeDictionary.
  defp app_settings_for(:test), do: []
  defp app_settings_for(_) do
    [mod: {Delorean.BuildManager.Application, []}]
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :build_manager_core,
      :campaign_status,
      :crawl_builder,
      :error_reporter,
      :links_builder,
      :on_page_builder,
      :rankings_builder,
      :runtime_config,
      :search_volume_builder,
      :shard,
      :statsd,
      :util,

      {:recon_ex, :external},
      {:exrm, :external, runtime: false},
      {:ex_syslogger, :external},
      {:gen_stage, :external}
    ]
  end
end

Code.require_file "../../mix_common.exs", __DIR__

defmodule DeloreanAPI.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :api,
      compilers: [:phoenix] ++ Mix.compilers,
      per_app_prod_config: Path.expand("config/per_app_prod_config.exs", __DIR__),
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application(mod: {DeloreanAPI, []})
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :common_models,
      :crawl_endpoint_models,
      :error_reporter,
      :freshscape_endpoint_models,
      :joe_fox_client,
      :legion,
      :links_endpoint_models,
      :links_models,
      :plug_util,
      :rankings_endpoint_models,
      :runtime_config,
      :s3,
      :shard_repository,
      :shard_storage,
      :statsd,
      :util,

      {:cowboy, :external},
      {:csv, :external},
      {:recon_ex, :external},
      {:exrm, :external, runtime: false},
      {:ex_syslogger, :external},
      {:hackney, :external},
      {:phoenix, :external},
      {:phoenix_html, :external},
      {:phoenix_pubsub, :external},
      {:plug, :external},
      {:crawl_builder, only: :test},
      {:phoenix_live_reload, :external, only: :dev},
      # We use this in tests to build a shard for our acceptance test.
      {:links_builder, only: :test},
      {:on_page_builder, only: :test},
      {:packrat_snapshot_repository, only: :test},
      {:rankings_builder, only: :test},
      {:search_volume_builder, only: :test},
      {:shard_repository},     # only: :test
    ]
  end
end

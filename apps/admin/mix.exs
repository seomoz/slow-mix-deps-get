Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.Admin.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :admin,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :campaign_status,
      :crawl_models,
      :cron,
      :error_reporter,
      :legion,
      :links_models,
      :on_page_models,
      :pager_duty,
      :rankings_models,
      :runtime_config,
      :s3,
      :search_volume_models,
      :shard,
      :shard_repository,
      :shard_storage,
      :statsd,
      :util,
      :worker_pool,

      {:recon_ex, :external},
      {:exrm, :external, runtime: false},
      {:ex_syslogger, :external},
      {:timex, :external},
    ]
  end
end

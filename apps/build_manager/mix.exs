Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.BuildManager.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :build_manager,
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

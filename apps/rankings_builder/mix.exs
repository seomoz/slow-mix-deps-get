Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.RankingsBuilder.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :rankings_builder,
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
      :packrat_snapshot_repository,
      :rankings_models,
      :shard_storage,
      :statsd,
      :util,
      :worker_pool,

      {:ex_json_schema, :external}, # only: :test
    ]
  end
end

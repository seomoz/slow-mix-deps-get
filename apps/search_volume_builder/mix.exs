Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.SearchVolumeBuilder.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :search_volume_builder,
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
      :packrat_snapshot_repository,
      :search_volume_models,
      :shard,
      :util,
    ]
  end
end

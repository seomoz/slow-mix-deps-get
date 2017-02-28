Code.require_file "../../mix_common.exs", __DIR__

defmodule ShardUpdateListGenerator.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :shard_update_list_generator,
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
    ]
  end
end

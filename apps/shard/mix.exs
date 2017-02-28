Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.Shard.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :shard,
      short_deps: short_deps())
  end

  # Configuration for the OTP application (see `mix help compile.app`)
  def application do
    Delorean.MixCommon.child_application()
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :runtime_config,
      :util,
    ]
  end
end

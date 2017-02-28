Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.Cron.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :cron,
      short_deps: short_deps())
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    Delorean.MixCommon.child_application(
      mod: {Delorean.Cron, []},
      included_applications: [
        :quantum,
      ],
    )
  end

  # Specifies umbrella project deps in short form (see `mix_common.exs`)
  defp short_deps do
    [
      :runtime_config,
      {:quantum, :external},
    ]
  end
end

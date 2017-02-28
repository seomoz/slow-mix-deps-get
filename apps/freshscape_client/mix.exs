Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.FreshscapeClient.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :freshscape_client,
      short_deps: short_deps())
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    Delorean.MixCommon.child_application()
  end

  defp short_deps do
    [
      :common_models,
      :legion,
      :rest_client,
      :util,

      {:exvcr, :external, only: :test, runtime: false},
    ]
  end
end

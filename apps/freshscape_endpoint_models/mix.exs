Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.FreshscapeEndpointModels.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :freshscape_endpoint_models,
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
      :freshscape_client,
      :legion,
      :util,

      {:public_suffix, :external},
      {:timex, :external},
    ]
  end
end

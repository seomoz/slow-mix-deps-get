Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.BarbosaClient.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :barbosa_client,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application()
  end

  defp short_deps do
    [
      :rankings_models, # Because we parse engine variants.
      :rest_client,

      {:exvcr, :external, only: :test, runtime: false},
    ]
  end
end

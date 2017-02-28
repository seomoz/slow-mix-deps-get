Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.LegionAPIClient.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :legion_api_client,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application(extra_application: [:crypto])
  end

  defp short_deps do
    [
      :rest_client,
      :runtime_config,
      :util,

      {:exvcr, :external, only: :test, runtime: false},
      {:process_tree_dictionary, :external, only: :test},
    ]
  end
end

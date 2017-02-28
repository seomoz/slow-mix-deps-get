Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.ErrorReporter.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :error_reporter,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application(
      included_applications: [
        :sentry,
      ],
      mod: {Delorean.ErrorReporter, []}
    )
  end

  defp short_deps do
    [
      :runtime_config,
      {:plug, :external}, # since `Sentry.Plug` checks for `Plug` being loaded before compilation
      # poison is explicitly required for travis to build successfully
      {:poison, :external},
      {:sentry, :external},
    ]
  end
end


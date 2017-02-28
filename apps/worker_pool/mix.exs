Code.require_file "../../mix_common.exs", __DIR__

defmodule Delorean.WorkerPool.Mixfile do
  use Mix.Project

  def project do
    Delorean.MixCommon.child_project(
      app: :worker_pool,
      short_deps: short_deps())
  end

  def application do
    Delorean.MixCommon.child_application()
  end

  defp short_deps do
    [
      :util,

      {:gen_stage, :external},
    ]
  end
end


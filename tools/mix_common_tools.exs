defmodule Delorean.MixCommon.Tools do

  @moduledoc """
  Common tools to simplify Delorean mix project management.
  """

  # expand project using default and map of deps' specs
  def expand_project(project_config, default_project, external_dep_specs) do
    {short_deps, project_config} = Keyword.pop(project_config, :short_deps, [])
    deps =
      short_deps
      |> process_short_deps(external_dep_specs)
      |> append_default_deps(Keyword.get(project_config, :app))
    Keyword.merge(default_project, [{:deps, deps} | project_config])
  end

  defp process_short_deps(short_deps, external_dep_specs) do
    Enum.map(short_deps, &process_single_dep(&1, external_dep_specs))
  end

  defp append_default_deps(deps,  nil), do: deps       # parent project
  defp append_default_deps(deps, :test_util), do: deps # no recursion
  defp append_default_deps(deps, _app) do
    [{:test_util, in_umbrella: true, only: :test} | deps]
  end

  defp process_single_dep({dep, :external}, external_dep_specs) do
    process_single_dep({dep, :external, []}, external_dep_specs)
  end
  defp process_single_dep({dep, :external, options}, external_dep_specs) do
    case Map.fetch!(external_dep_specs, dep) do
      {requirement, dep_options} when is_binary(requirement) and is_list(dep_options) ->
        {dep, requirement, dep_options}
      dep_options when is_list(dep_options) -> {dep, Keyword.merge(dep_options, options)}
      requirement when is_binary(requirement) -> {dep, requirement, options}
    end
  end
  defp process_single_dep(dep, _external_dep_specs) when is_atom(dep) do
    {dep, in_umbrella: true}
  end
  defp process_single_dep({dep}, _external_dep_specs) do
    {dep, in_umbrella: true}
  end
  defp process_single_dep({dep, options}, _external_dep_specs) do
    {dep, [{:in_umbrella, true} | options]}
  end
end

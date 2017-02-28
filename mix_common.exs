Code.require_file "tools/mix_common_tools.exs", __DIR__

defmodule Delorean.MixCommon do

  @moduledoc """
  Common definitions for umbrella-based projects.

  example of root project:
  ```ex
  def project do
    Delorean.MixCommon.parent_project(
      apps_path: "apps",
      short_deps: short_deps())
  end
  ```

  example of in-umbrella project:
  ```ex
  def project do
    Delorean.MixCommon.child_project(
      app: :s3,
      short_deps: short_deps())
  end
  ```
  Parameters (except for `short_deps`) are regular project configuration parameters. They can
  override defaults below.

  short_deps are Delorean-specific. They have form:
  ```ex
  defp short_deps do
    [
      :delorean_app,                       # it is actually a shorthand for `{:delorean_app}`
      {:delorean_app, option: value},      # arbitrary options
      {:external_app, :external},          # :external indicates non-delorean deps
      {:external_app, :external, option: value},
      # ...
    ]
  end
  ```

  In addition, `:test_util` is automatically added to dependencies as a test-only dependency
  for in-umbrella projects.

  For consistency and convenience (and to minimize git churn), please observe the following
  formatting guidelines when adding a dependency:

  * Dependencies should be listed alphabetically, first in-umbrella, then external.
  * Environment-specific deps (e.g. `only: env`) should be listed after the main list of
    dependencies and should be separated by a blank line.
  """

  # Since we have only one parent, the difference between parent and children ends up
  # in the parent mix file. OTOH, `default_child_project` sets common defaults for all
  # in-umbrellas.
  defp default_project do
    [
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      preferred_cli_env: [
          "test_all": :test,
          "vcr": :test,
          "vcr.delete": :test,
          "vcr.check": :test,
          "vcr.show": :test,
        ],
      docs: [
        extras: ["README.md"],
        source_url: "https://github.com/seomoz/delorean",
        source_root: __DIR__,
      ],
    ]
  end

  defp default_child_project do
    default_project() ++
    [
      version: "0.0.1",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      elixirc_paths: elixirc_paths(Mix.env) |> Enum.filter(&File.dir?/1),
    ]
  end

  # For convenience of handling, the external dependencies use this map to specify origin of the
  # application. It is simple map of dep name (atom) to either requirement, or options.
  #
  # To simplify navigation, deps are sorted.
  #
  # It is nice to have source repo documented, so we will know where to contribute.
  defp external_dep_specs do
    %{
      # alco/benchfella: Microbenchmarking tool for Elixir
      benchfella: "~> 0.2",
      # whatyouhide/corsica: A plug and a DSL for handling CORS requests
      corsica: "~> 0.4",
      # ninenines/cowboy: Small, fast, modular HTTP server (Erlang)
      cowboy: "~> 1.0",
      # beatrichartz/csv: CSV decoding and encoding
      csv: "~> 1.2",
      # jeremyjh/dialyxir: Mix tasks to simplify use of Dialyzer
      dialyxir: "~> 0.4",
      # pragdave/earmark: Markdown parser for Elixir (needed for ex_doc)
      earmark: "~> 0.1",
      # elixir-lang/ecto: A database wrapper and language integrated query
      ecto: ">= 2.1.0",
      # CargoSense/ex_aws: A flexible, easy to use set of clients AWS APIs
      ex_aws: ">= 1.1.0",
      # elixir-lang/ex_doc: produces HTML and online documentation for Elixir projects
      ex_doc: "~> 0.11",
      # jonasschmidt/ex_json_schema: A JSON Schema validator with full support for the draft 4 specification
      ex_json_schema: "~> 0.3",
      # CargoSense/ex_statsd: A statsd client implementation
      ex_statsd: ">= 0.5.3",
      # bitwalker/exrm: Automatically generate a release for your Elixir project
      exrm: [git: "https://github.com/bitwalker/exrm.git"],
      # parroty/exvcr: HTTP request/response recording library for elixir, inspired by VCR.
      exvcr: ">= 0.8.4",
      # lashmili/ex_syslogger: ExSyslogger is a Elixir Logger custom backend to syslog.
      ex_syslogger: "~> 1.2",
      # elixir-lang/gen_stage: GenStage specification and computational flow for Elixir
      gen_stage: "~> 0.11",
      # benoitc/hackney: simple HTTP client (Erlang)
      hackney: ">= 1.6.3",
      # edgurgel/httpoison: HTTP client for Elixir (based on hackney)
      httpoison: "~> 0.10",
      # xerions/mariaex: Pure elixir database driver for Mariadb / Mysql
      mariaex: ">= 0.7.7",
      # phoenixframework/phoenix: A web framework
      phoenix: "~> 1.1",
      # phoenixframework/phoenix_html: Collection of helpers to generate and manipulate HTML contents.
      phoenix_html: "~> 2.3",
      # phoenixframework/phoenix_live_reload: A project for live-reload functionality during development.
      phoenix_live_reload: "~> 1.0",
      # phoenixframework/phoenix_pubsub: Distributed PubSub and Presence platform for the Phoenix Framework
      phoenix_pubsub: "~> 1.0",
      # elixir-lang/plug: A spec and conveniences for composable modules between web applications
      plug: "~> 1.0",
      # devinus/poison: An incredibly fast, pure Elixir JSON library
      poison: "~> 2.0",
      # seomoz/process_tree_dictionary: Implements a dictionary that is scoped to a process tree for Erlang and Elixir.
      process_tree_dictionary: ">= 1.0.0",
      # seomoz/publicsuffix-elixir: Elixir library providing public suffix logic based on publicsuffix.org data
      public_suffix: ">= 0.2.0",
      # c-rack/quantum-elixir: Cron-like job scheduler
      quantum: ">= 1.6.1",
      # pragdave/quixir: Property-based testing for Elixir
      quixir: ">= 0.9.1",
      # tatsuya6502/recon_ex: Elixir wrapper for Recon, tools to diagnose Erlang VM safely in production
      recon_ex: ">= 0.9.1",
      # getsentry/sentry-elixir: The official Elixir SDK for Sentry (sentry.io) https://sentry.io
      sentry: "~> 2.1",
      # awetzel/sweet_xml: A thin wrapper around :xmerl
      sweet_xml: "~> 0.5",
      # bitwalker/timex: A complete date/time library
      timex: ">= 3.1.5",
    }
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # expand configuration for parent project
  def parent_project(project_config) do
    __MODULE__.Tools.expand_project(project_config, default_project(), external_dep_specs())
  end

  # expand configuration for in-umbrella project
  def child_project(project_config) do
    __MODULE__.Tools.expand_project(project_config, default_child_project(), external_dep_specs())
  end

  def child_application(app_config \\ []) do
    {extra_apps, app_config} = Keyword.pop(app_config, :extra_applications, [])

    [
      # :runtime_tools supports the :observer
      extra_applications: [:logger, :runtime_tools | extra_apps]
    ]
    |> Keyword.merge(app_config)
  end
end

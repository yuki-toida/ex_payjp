defmodule ExPayjp.MixProject do
  use Mix.Project

  @description """
  simple HTTP client for PAY.JP
  """
  
  def project do
    [
      app: :ex_payjp,
      version: "0.1.0",
      elixir: "~> 1.6",
      name: "ExPayjp",
      description: @description,
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0", override: true},
      {:poison, "~> 3.1", override: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  def package do
    [
      maintainers: ["yuki-toida"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/yuki-toida/ex_payjp"}
    ]    
  end

end

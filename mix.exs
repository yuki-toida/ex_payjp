defmodule ExPayjp.MixProject do
  use Mix.Project

  @description """
  simple HTTP client for PAY.JP
  """
  
  def project do
    [
      app: :ex_payjp,
      version: "0.5.0",
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
      {:ex_doc, "~> 0.18", only: :dev},
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"}
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

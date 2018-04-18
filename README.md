# ExPayjp

simple HTTP client for [PAY.JP](https://pay.jp/).

## Installation

```elixir
def deps do
  [
    {:ex_payjp, "~> 0.1.0"}
  ]
end
```

## Configuration

```elixir
use Mix.Config

config :payjp,
  secret_key: "YOUR SECRET KEY"
```
or environment variables
```bash
export PAYJP_SECRET_KEY="YOUR SECRET KEY"
```

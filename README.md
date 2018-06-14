# ExPayjp
simple HTTP client for [PAY.JP](https://pay.jp/).

## Installation
```elixir
def deps do
  [
    {:ex_payjp, "~> 0.3.0"}
  ]
end
```

## Configuration
```elixir
use Mix.Config

config :payjp,
  secret_key: "YOUR SECRET KEY",
  expiry_days: 1
```

expiry_days: default value is 1.  
secret_key: you can use environment variables.

```bash
export PAYJP_SECRET_KEY="YOUR SECRET KEY"
```

## License
MIT
defmodule Envoy.Extensions.AccessLoggers.Wasm.V3.WasmAccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Envoy.Extensions.Wasm.V3.PluginConfig.t() | nil
        }
  defstruct [:config]

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end

defmodule Envoy.Api.V2.Listener.QuicProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_concurrent_streams: Google.Protobuf.UInt32Value.t() | nil,
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          crypto_handshake_timeout: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:max_concurrent_streams, :idle_timeout, :crypto_handshake_timeout]

  field :max_concurrent_streams, 1, type: Google.Protobuf.UInt32Value
  field :idle_timeout, 2, type: Google.Protobuf.Duration
  field :crypto_handshake_timeout, 3, type: Google.Protobuf.Duration
end

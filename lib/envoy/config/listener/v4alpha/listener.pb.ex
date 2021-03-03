defmodule Envoy.Config.Listener.V4alpha.Listener.DrainType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :MODIFY_ONLY

  field :DEFAULT, 0
  field :MODIFY_ONLY, 1
end

defmodule Envoy.Config.Listener.V4alpha.ListenerCollection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entries: [Xds.Core.V3.CollectionEntry.t()]
        }
  defstruct [:entries]

  field :entries, 1, repeated: true, type: Xds.Core.V3.CollectionEntry
end

defmodule Envoy.Config.Listener.V4alpha.Listener.DeprecatedV1 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bind_to_port: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:bind_to_port]

  field :bind_to_port, 1, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Listener.V4alpha.Listener.ConnectionBalanceConfig.ExactBalance do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Listener.V4alpha.Listener.ConnectionBalanceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          balance_type: {atom, any}
        }
  defstruct [:balance_type]

  oneof :balance_type, 0

  field :exact_balance, 1,
    type: Envoy.Config.Listener.V4alpha.Listener.ConnectionBalanceConfig.ExactBalance,
    oneof: 0
end

defmodule Envoy.Config.Listener.V4alpha.Listener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          address: Envoy.Config.Core.V4alpha.Address.t() | nil,
          filter_chains: [Envoy.Config.Listener.V4alpha.FilterChain.t()],
          use_original_dst: Google.Protobuf.BoolValue.t() | nil,
          default_filter_chain: Envoy.Config.Listener.V4alpha.FilterChain.t() | nil,
          per_connection_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil,
          metadata: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          drain_type: Envoy.Config.Listener.V4alpha.Listener.DrainType.t(),
          listener_filters: [Envoy.Config.Listener.V4alpha.ListenerFilter.t()],
          listener_filters_timeout: Google.Protobuf.Duration.t() | nil,
          continue_on_listener_filters_timeout: boolean,
          transparent: Google.Protobuf.BoolValue.t() | nil,
          freebind: Google.Protobuf.BoolValue.t() | nil,
          socket_options: [Envoy.Config.Core.V4alpha.SocketOption.t()],
          tcp_fast_open_queue_length: Google.Protobuf.UInt32Value.t() | nil,
          traffic_direction: Envoy.Config.Core.V4alpha.TrafficDirection.t(),
          udp_listener_config: Envoy.Config.Listener.V4alpha.UdpListenerConfig.t() | nil,
          api_listener: Envoy.Config.Listener.V4alpha.ApiListener.t() | nil,
          connection_balance_config:
            Envoy.Config.Listener.V4alpha.Listener.ConnectionBalanceConfig.t() | nil,
          reuse_port: boolean,
          access_log: [Envoy.Config.Accesslog.V4alpha.AccessLog.t()],
          udp_writer_config: Envoy.Config.Core.V4alpha.TypedExtensionConfig.t() | nil,
          tcp_backlog_size: Google.Protobuf.UInt32Value.t() | nil,
          bind_to_port: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [
    :name,
    :address,
    :filter_chains,
    :use_original_dst,
    :default_filter_chain,
    :per_connection_buffer_limit_bytes,
    :metadata,
    :drain_type,
    :listener_filters,
    :listener_filters_timeout,
    :continue_on_listener_filters_timeout,
    :transparent,
    :freebind,
    :socket_options,
    :tcp_fast_open_queue_length,
    :traffic_direction,
    :udp_listener_config,
    :api_listener,
    :connection_balance_config,
    :reuse_port,
    :access_log,
    :udp_writer_config,
    :tcp_backlog_size,
    :bind_to_port
  ]

  field :name, 1, type: :string
  field :address, 2, type: Envoy.Config.Core.V4alpha.Address
  field :filter_chains, 3, repeated: true, type: Envoy.Config.Listener.V4alpha.FilterChain
  field :use_original_dst, 4, type: Google.Protobuf.BoolValue
  field :default_filter_chain, 25, type: Envoy.Config.Listener.V4alpha.FilterChain
  field :per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value
  field :metadata, 6, type: Envoy.Config.Core.V4alpha.Metadata
  field :drain_type, 8, type: Envoy.Config.Listener.V4alpha.Listener.DrainType, enum: true
  field :listener_filters, 9, repeated: true, type: Envoy.Config.Listener.V4alpha.ListenerFilter
  field :listener_filters_timeout, 15, type: Google.Protobuf.Duration
  field :continue_on_listener_filters_timeout, 17, type: :bool
  field :transparent, 10, type: Google.Protobuf.BoolValue
  field :freebind, 11, type: Google.Protobuf.BoolValue
  field :socket_options, 13, repeated: true, type: Envoy.Config.Core.V4alpha.SocketOption
  field :tcp_fast_open_queue_length, 12, type: Google.Protobuf.UInt32Value
  field :traffic_direction, 16, type: Envoy.Config.Core.V4alpha.TrafficDirection, enum: true
  field :udp_listener_config, 18, type: Envoy.Config.Listener.V4alpha.UdpListenerConfig
  field :api_listener, 19, type: Envoy.Config.Listener.V4alpha.ApiListener

  field :connection_balance_config, 20,
    type: Envoy.Config.Listener.V4alpha.Listener.ConnectionBalanceConfig

  field :reuse_port, 21, type: :bool
  field :access_log, 22, repeated: true, type: Envoy.Config.Accesslog.V4alpha.AccessLog
  field :udp_writer_config, 23, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig
  field :tcp_backlog_size, 24, type: Google.Protobuf.UInt32Value
  field :bind_to_port, 26, type: Google.Protobuf.BoolValue
end

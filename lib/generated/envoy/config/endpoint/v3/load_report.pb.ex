defmodule Envoy.Config.Endpoint.V3.UpstreamLocalityStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Config.Core.V3.Locality.t() | nil,
          total_successful_requests: non_neg_integer,
          total_requests_in_progress: non_neg_integer,
          total_error_requests: non_neg_integer,
          total_issued_requests: non_neg_integer,
          load_metric_stats: [Envoy.Config.Endpoint.V3.EndpointLoadMetricStats.t()],
          upstream_endpoint_stats: [Envoy.Config.Endpoint.V3.UpstreamEndpointStats.t()],
          priority: non_neg_integer
        }
  defstruct [
    :locality,
    :total_successful_requests,
    :total_requests_in_progress,
    :total_error_requests,
    :total_issued_requests,
    :load_metric_stats,
    :upstream_endpoint_stats,
    :priority
  ]

  field :locality, 1, type: Envoy.Config.Core.V3.Locality
  field :total_successful_requests, 2, type: :uint64
  field :total_requests_in_progress, 3, type: :uint64
  field :total_error_requests, 4, type: :uint64
  field :total_issued_requests, 8, type: :uint64

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats

  field :upstream_endpoint_stats, 7,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamEndpointStats

  field :priority, 6, type: :uint32
end

defmodule Envoy.Config.Endpoint.V3.UpstreamEndpointStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Config.Core.V3.Address.t() | nil,
          metadata: Google.Protobuf.Struct.t() | nil,
          total_successful_requests: non_neg_integer,
          total_requests_in_progress: non_neg_integer,
          total_error_requests: non_neg_integer,
          total_issued_requests: non_neg_integer,
          load_metric_stats: [Envoy.Config.Endpoint.V3.EndpointLoadMetricStats.t()]
        }
  defstruct [
    :address,
    :metadata,
    :total_successful_requests,
    :total_requests_in_progress,
    :total_error_requests,
    :total_issued_requests,
    :load_metric_stats
  ]

  field :address, 1, type: Envoy.Config.Core.V3.Address
  field :metadata, 6, type: Google.Protobuf.Struct
  field :total_successful_requests, 2, type: :uint64
  field :total_requests_in_progress, 3, type: :uint64
  field :total_error_requests, 4, type: :uint64
  field :total_issued_requests, 7, type: :uint64

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats
end

defmodule Envoy.Config.Endpoint.V3.EndpointLoadMetricStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metric_name: String.t(),
          num_requests_finished_with_metric: non_neg_integer,
          total_metric_value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:metric_name, :num_requests_finished_with_metric, :total_metric_value]

  field :metric_name, 1, type: :string
  field :num_requests_finished_with_metric, 2, type: :uint64
  field :total_metric_value, 3, type: :double
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          category: String.t(),
          dropped_count: non_neg_integer
        }
  defstruct [:category, :dropped_count]

  field :category, 1, type: :string
  field :dropped_count, 2, type: :uint64
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          cluster_service_name: String.t(),
          upstream_locality_stats: [Envoy.Config.Endpoint.V3.UpstreamLocalityStats.t()],
          total_dropped_requests: non_neg_integer,
          dropped_requests: [Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests.t()],
          load_report_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [
    :cluster_name,
    :cluster_service_name,
    :upstream_locality_stats,
    :total_dropped_requests,
    :dropped_requests,
    :load_report_interval
  ]

  field :cluster_name, 1, type: :string
  field :cluster_service_name, 6, type: :string

  field :upstream_locality_stats, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamLocalityStats

  field :total_dropped_requests, 3, type: :uint64

  field :dropped_requests, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests

  field :load_report_interval, 4, type: Google.Protobuf.Duration
end
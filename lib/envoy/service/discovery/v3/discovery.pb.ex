defmodule Envoy.Service.Discovery.V3.DiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          node: Envoy.Config.Core.V3.Node.t() | nil,
          resource_names: [String.t()],
          type_url: String.t(),
          response_nonce: String.t(),
          error_detail: Google.Rpc.Status.t() | nil
        }
  defstruct [:version_info, :node, :resource_names, :type_url, :response_nonce, :error_detail]

  field :version_info, 1, type: :string
  field :node, 2, type: Envoy.Config.Core.V3.Node
  field :resource_names, 3, repeated: true, type: :string
  field :type_url, 4, type: :string
  field :response_nonce, 5, type: :string
  field :error_detail, 6, type: Google.Rpc.Status
end

defmodule Envoy.Service.Discovery.V3.DiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          resources: [Google.Protobuf.Any.t()],
          canary: boolean,
          type_url: String.t(),
          nonce: String.t(),
          control_plane: Envoy.Config.Core.V3.ControlPlane.t() | nil
        }
  defstruct [:version_info, :resources, :canary, :type_url, :nonce, :control_plane]

  field :version_info, 1, type: :string
  field :resources, 2, repeated: true, type: Google.Protobuf.Any
  field :canary, 3, type: :bool
  field :type_url, 4, type: :string
  field :nonce, 5, type: :string
  field :control_plane, 6, type: Envoy.Config.Core.V3.ControlPlane
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V3.Node.t() | nil,
          type_url: String.t(),
          resource_names_subscribe: [String.t()],
          xds_resources_subscribe: [Xds.Core.V3.ResourceLocator.t()],
          resource_names_unsubscribe: [String.t()],
          xds_resources_unsubscribe: [Xds.Core.V3.ResourceLocator.t()],
          initial_resource_versions: %{String.t() => String.t()},
          response_nonce: String.t(),
          error_detail: Google.Rpc.Status.t() | nil
        }
  defstruct [
    :node,
    :type_url,
    :resource_names_subscribe,
    :xds_resources_subscribe,
    :resource_names_unsubscribe,
    :xds_resources_unsubscribe,
    :initial_resource_versions,
    :response_nonce,
    :error_detail
  ]

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :type_url, 2, type: :string
  field :resource_names_subscribe, 3, repeated: true, type: :string
  field :xds_resources_subscribe, 8, repeated: true, type: Xds.Core.V3.ResourceLocator
  field :resource_names_unsubscribe, 4, repeated: true, type: :string
  field :xds_resources_unsubscribe, 9, repeated: true, type: Xds.Core.V3.ResourceLocator

  field :initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    map: true

  field :response_nonce, 6, type: :string
  field :error_detail, 7, type: Google.Rpc.Status
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          system_version_info: String.t(),
          resources: [Envoy.Service.Discovery.V3.Resource.t()],
          type_url: String.t(),
          removed_resources: [String.t()],
          udpa_removed_resources: [Xds.Core.V3.ResourceName.t()],
          nonce: String.t()
        }
  defstruct [
    :system_version_info,
    :resources,
    :type_url,
    :removed_resources,
    :udpa_removed_resources,
    :nonce
  ]

  field :system_version_info, 1, type: :string
  field :resources, 2, repeated: true, type: Envoy.Service.Discovery.V3.Resource
  field :type_url, 4, type: :string
  field :removed_resources, 6, repeated: true, type: :string
  field :udpa_removed_resources, 7, repeated: true, type: Xds.Core.V3.ResourceName
  field :nonce, 5, type: :string
end

defmodule Envoy.Service.Discovery.V3.Resource.CacheControl do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          do_not_cache: boolean
        }
  defstruct [:do_not_cache]

  field :do_not_cache, 1, type: :bool
end

defmodule Envoy.Service.Discovery.V3.Resource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          xds_resource_name: Xds.Core.V3.ResourceName.t() | nil,
          aliases: [String.t()],
          version: String.t(),
          resource: Google.Protobuf.Any.t() | nil,
          ttl: Google.Protobuf.Duration.t() | nil,
          cache_control: Envoy.Service.Discovery.V3.Resource.CacheControl.t() | nil
        }
  defstruct [:name, :xds_resource_name, :aliases, :version, :resource, :ttl, :cache_control]

  field :name, 3, type: :string
  field :xds_resource_name, 5, type: Xds.Core.V3.ResourceName
  field :aliases, 4, repeated: true, type: :string
  field :version, 1, type: :string
  field :resource, 2, type: Google.Protobuf.Any
  field :ttl, 6, type: Google.Protobuf.Duration
  field :cache_control, 7, type: Envoy.Service.Discovery.V3.Resource.CacheControl
end

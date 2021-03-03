defmodule Envoy.Extensions.Filters.Http.Tap.V3.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig.t() | nil
        }
  defstruct [:common_config]

  field :common_config, 1, type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig
end

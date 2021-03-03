defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          trust_bundle: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [:name, :trust_bundle]

  field :name, 1, type: :string
  field :trust_bundle, 2, type: Envoy.Config.Core.V3.DataSource
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trust_domains: [
            Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain.t()
          ]
        }
  defstruct [:trust_domains]

  field :trust_domains, 1,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain
end

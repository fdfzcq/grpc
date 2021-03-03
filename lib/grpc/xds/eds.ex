defmodule GRPC.XDS.EDS do
    def register(), do: :ok
end
defmodule GRPC.XDS.EDS.Service do
    use GRPC.Service, name: "envoy.service.endpoint.v3.EndpointDiscoveryService"

    rpc :StreamEndpoints,
        Envoy.Service.Discovery.V3.DiscoveryRequest,
        Envoy.Service.Discovery.V3.DiscoveryResponse

    # TODO add delta API
end
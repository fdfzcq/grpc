defmodule GRPC.XDS.EDS do
    def register(), do: :ok
end
defmodule GRPC.XDS.EDS.Service do
    use GRPC.Service, name: "envoy.service.endpoint.v3.EndpointDiscoveryService"
end
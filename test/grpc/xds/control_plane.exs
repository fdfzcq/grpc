defmodule GRPC.ControlPlane.EDS do
    # test control plane
    use GRPC.Server, service: GRPC.XDS.EDS.Service
    
    def stream_endpoints(request, _stream) do
        # todo
    end

    def fetch_endpoints(request, _stream) do
        # todo
    end
end
defmodule GRPC.ControlPlane.Cache do
    defstruct [

    ]
end
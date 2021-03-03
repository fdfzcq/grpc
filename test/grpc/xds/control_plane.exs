defmodule GRPC.ControlPlane.EDS do
    # test control plane
    use GRPC.Server, service: GRPC.XDS.EDS.Service
    
    def register(request, _stream) do
        
    end
end
defmodule GRPC.ControlPlane.Cache do
    defstruct [

    ]
end
defmodule GRPC.XDS.ControlPlane do
    # minimal test control plane
    def setup(test_module) do
        :ets.new(:control_plane_test, [:named_table])
        :ets.insert(:control_plane_test, {test_module, %Cache{}})
    end

    def register() do
        # register and store info in cache
    end

    defmodule Cache do
        defstruct [
    
        ]
    end

    defmodule EDS do
        # test control plane
        use GRPC.Server, service: GRPC.XDS.EDS.Service
        
        def stream_endpoints(request, _stream) do
            %{ :version => version,
               :resource_names => names,
            } = request
            Envoy.Service.Discovery.V3.DiscoveryResponse.new(
                version: version,
                # TODO: fill in resources
                # resources: resources
                canary: false,
                type_url: "",
                nonce: "",
                control_plance:
                    Envoy.Config.Core.V3.ControlPlane.new(
                        identifier: ""
                    )
            )
        end
    end
end

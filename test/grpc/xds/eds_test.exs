defmodule GRPC.XDS.EDSTest do
    use ExUnit.Case
    import GRPC.XDS.ControlPlane.EDS
    
    setup_all do
        ControlPlane.setup(__MODULE__)
    end
end
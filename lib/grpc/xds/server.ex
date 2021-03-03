defmodule GRPC.XDS.Server do
    import GRPC.XDS.ADS
    import GRPC.XDS.EDS
    import GRPC.XDS.CDS
    import GRPC.XDS.RDS
    import GRPC.XDS.LDS    

    def reigster_service() do
        ADS.register()
        EDS.register()
        CDS.register()
        RDS.register()
        LDS.register()
    end
end
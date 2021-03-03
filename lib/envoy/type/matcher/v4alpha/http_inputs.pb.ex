defmodule Envoy.Type.Matcher.V4alpha.HttpRequestHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t()
        }
  defstruct [:header_name]

  field :header_name, 1, type: :string
end

defmodule Envoy.Type.Matcher.V4alpha.HttpResponseHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t()
        }
  defstruct [:header_name]

  field :header_name, 1, type: :string
end

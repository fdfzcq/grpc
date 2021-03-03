defmodule Envoy.Config.Core.V3.SubstitutionFormatString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          format: {atom, any},
          omit_empty_values: boolean,
          content_type: String.t()
        }
  defstruct [:format, :omit_empty_values, :content_type]

  oneof :format, 0
  field :text_format, 1, type: :string, oneof: 0
  field :json_format, 2, type: Google.Protobuf.Struct, oneof: 0
  field :omit_empty_values, 3, type: :bool
  field :content_type, 4, type: :string
end

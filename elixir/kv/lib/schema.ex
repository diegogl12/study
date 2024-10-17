defmodule KV.Schema do
  def get(
        schema,
        field,
        default \\ %{},
        filter_fuction \\ fn {_field, value} -> not is_nil(value) end
      ) do
    schema
    |> Map.delete(:__struct__)
    |> Enum.filter(filter_fuction)
    |> Map.new()
    |> Map.get(field, default)
  end

  @doc false
  defmacro __using__(_opts) do
    quote do
      defdelegate get(
                    schema,
                    field,
                    default \\ %{},
                    filter_fuction \\ fn {_field, value} -> not is_nil(value) end
                  ),
                  to: unquote(__MODULE__)

      @schema_meta_fields [:__meta__]

      def new(params) when is_map(params) do
        params
        |> Map.to_list()
        |> new()
      end

      def new(params) when is_list(params) do
        struct!(__MODULE__, params)
      end

      @spec touch(Ecto.Changeset.t()) :: Ecto.Changeset.t()
      defp touch(%Ecto.Changeset{} = changeset) do
        changeset
        |> Ecto.Changeset.cast(%{updated_at: DateTime.utc_now()}, [:updated_at])
      end

      def to_storeable_map(struct) do
        association_fields = struct.__struct__.__schema__(:associations)
        waste_fields = association_fields ++ @schema_meta_fields

        struct |> Map.from_struct() |> Map.drop(waste_fields)
      end
    end
  end
end

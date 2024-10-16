defmodule GenQuery do
  @query "INSERT INTO carrier_swap_rules (country, region_name, city, technology, carrier_id, address_slug)\nVALUES "
  @country_br "BR"
  @tim_id 4
  @output_file_path "output.txt"
  @region_name_converter %{
    "AC" => "Acre - AC",
    "AL" => "Alagoas - AL",
    "AM" => "Amazonas - AM",
    "AP" => "Amapá - AP",
    "BA" => "Bahia - BA",
    "CE" => "Ceará - CE",
    "DF" => "Distrito Federal - DF",
    "ES" => "Espírito Santo - ES",
    "GO" => "Goiás - GO",
    "MA" => "Maranhão - MA",
    "MG" => "Minas Gerais - MG",
    "MS" => "Mato Grosso do Sul - MS",
    "MT" => "Mato Grosso - MT",
    "PA" => "Pará - PA",
    "PB" => "Paraíba - PB",
    "PE" => "Pernambuco - PE",
    "PI" => "Piauí - PI",
    "PR" => "Paraná - PR",
    "RJ" => "Rio de Janeiro - RJ",
    "RN" => "Rio Grande do Norte - RN",
    "RO" => "Rondônia - RO",
    "RR" => "Roraima - RR",
    "RS" => "Rio Grande do Sul - RS",
    "SC" => "Santa Catarina - SC",
    "SE" => "Sergipe - SE",
    "SP" => "São Paulo - SP",
    "TO" => "Tocantins - TO"
  }

  def main(args) do
    opts = handle_options(args)

    get_csv_data(opts[:input])
    |> gen_csv_output
  end

  defp handle_options(args) do
    options = [switches: [input: :string], aliases: [i: :input]]

    {opts,_,_} = OptionParser.parse(args, options)

    opts
  end

  defp get_csv_data(path) do
    Path.expand(path)
    |> File.stream!
    |> CSV.decode(separator: ?;, headers: true)
    |> Enum.map(fn x -> x end)
  end

  defp gen_csv_output(data) do
    File.rm(@output_file_path)
    Enum.each(data, fn item ->
      gen_query(item)
      |> write_file()
    end)
  end

  defp gen_query({:ok, values}) do
      @query
      <> "('#{@country_br}', '#{@region_name_converter[values["UF"]]}', '#{values["MUNICIPIO"]}', '#{values["TECH"]}', '#{@tim_id}', '"
      <> Slugger.slugify_downcase("#{@country_br} #{@region_name_converter[values["UF"]]} #{values["MUNICIPIO"]}")
      <> "');\n\n"
  end

  defp gen_query(_), do: ""

  defp write_file(content) do
    {:ok, file} = File.open(@output_file_path,[:append, :utf8])
    IO.write(file,content)
    File.close(file)
  end
end

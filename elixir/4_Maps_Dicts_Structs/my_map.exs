people = [
  %{ name: "Grumpy", height: 1.94 },
  %{ name: "Dave", height: 1.88 },
  %{ name: "John", height: 1.32 },
  %{ name: "Fan", height: 1.1 },
  %{ name: "Larry", height: 1.75 }
]

for person = %{ height: height } <- people,
  height > 1.5,
  do: IO.inspect(person)

defmodule MyMap do


  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end


end



defmodule HotelRoom do
  def book(%{ name: name, height: height })
  when height > 1.7 do
    IO.puts "Need an extra long bed for #{name}"
  end

  def book( %{ name: name, height: height } )
  when height < 1.3 do
    IO.puts "Keep the switches low for #{name}"
  end

  def book(person) do
    IO.puts("Normal bed for this customer #{person.name}")
  end
end
defmodule RpiBlink do
  alias Nerves.Leds
  require Logger

  @on_duration  200
  @off_duration 200

  def start() do
    led = Application.get_env(:blinky, :led)
    Logger.debug "list of leds to blink is #{inspect led_list}"
    spawn fn -> blink_led_forever(led) end
  end

  defp blink_led_forever(pin) do
    IO.puts "Blink!"
    Leds.set [{pin, true}]
    :timer.sleep(@on_duration)
    Leds.set [{pin, false}]
    :timer.sleep(@off_duration)

    blink_led_forever(pin)
  end
end

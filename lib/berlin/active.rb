require 'rpi_gpio'

class Active
  def initialize
    puts Pastel.new.green("Berlin Activated")
  end
  def on
    puts Pastel.new.red("This program in under development, please do not use it yet.")
    puts Pastel.new.yellow("Proceed anyway?")
    require rpi_gpio if gets.chomp == "y" || "yes"
    puts Pastel.new.green("SUCCESS!")
  end
end

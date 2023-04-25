#!/usr/bin/env ruby

puts "Starting Application `Berlin'. . ."

begin
  require 'tty-spinner'
  LIB_REQ = "success"
rescue LoadError
  puts "\tERROR: `tty-spinner' is not installed, run `bundler install'\n"
end

begin
  require 'pastel'
  LIB_REQ2 = "success"
rescue LoadError
  puts "\tERROR: `pastel' is not installed, run `bundler install'\n"
end

begin
  require 'rpi_gpio'
  LIB_REQ3 = "success"
rescue LoadError
  puts Pastel.new.red("\tERROR: fatal ::") + Pastel.new.yellow("`rpi_gpio' is not installed, run `bundler install'\n")
end

pastel = Pastel.new
puts pastel.green("Startup successful!\n\n") if defined?(LIB_REQ) && defined?(LIB_REQ2) && defined?(LIB_REQ3)

format ="#{pastel.yellow("Loading Libraries… :spinner")}"
spinner = TTY::Spinner.new(format, format: :bouncing_ball, success_mark: pastel.green("[✔]"), error_mark: pastel.red("[✖]"))
spinner.auto_spin
begin
  require_relative 'lib/berlin'
  # sleep(1)
  spinner.success("\n#{pastel.green("Libraries loaded!")}\n")
rescue LoadError
  spinner.error
  puts "\t" + pastel.red("ERROR:") + pastel.yellow("`berlin.rb is not loaded, please make sure file is present under ./lib'")
end

Berlin::Test.new

puts pastel.white("Activate `Berlin'?")
answer = gets.chomp

berlin = Active.new if answer == "y" || answer == "yes"
return unless answer == "y" || answer == "yes"

puts pastel.white("Turn `Berlin' on?") if answer == "yes" || answer == "y"
answer = gets.chomp

berlin.on if answer == 'y' || 'yes'

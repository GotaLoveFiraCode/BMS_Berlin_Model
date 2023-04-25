# version:  0.4-alpha
#  author:  Laurens T. Rosinski
# license:  AGPL-3.0
#  github:  <https://github.com/GotaLoveFiraCode/BMS_Berlin_Model>
# credits:  Ms Millian, archlinux.org, rubymonk.org

puts ":: Starting Application `Berlin'. . .\n"

begin
  require 'tty-spinner'
  LIB_REQ1 = ''
rescue LoadError
  abort("\tERROR: `tty-spinner' is not installed, run `bundler install'.\n")
end

begin
  require 'inquirer'
  LIB_REQ2 = ''
rescue LoadError
  puts "\tERROR: `inquirer' is not installed, run `bundler install'.\n"
end

# gpio_ans = Ask.list "Which gpio ruby gem do you want to use", [
#   "`pi_piper' (recomended)",
#   "`rpi_gpio' (untested)"
# ]

gpio_ans = Ask.confirm "Use `rpi_gpio' (untested) instead of `pi_piper' (recomended)", default: false
if gpio_ans == "true"
  begin
    require 'rpi_gpio'
    LIB_REQ3 = ''
  rescue LoadError
    puts "\tFATAL: `rpi_gpio' is not installed, run `bundler install'.\n"
  end
else
  begin
    require 'pi_piper'
    LIB_REQ3 = ''
  rescue LoadError
    puts "\tFATAL: `pi_piper' is not installed, run `bundler install'.\n"
  end
end

unless defined?(LIB_REQ1) and defined?(LIB_REQ2) and defined?(LIB_REQ3)
  abort("\tFATAL: gems are not installed/loaded, run `sudo bundler install'.")
else
  puts ":: Startup successful!\n"
end

puts "\n:: Loading libraries. . .\n"
begin
  require './berlin.rb'
  berlin = Berlin.new
  puts ":: Libraries loaded!"
rescue LoadError
  abort("\tFATAL: `berlin.rb' is not loaded, please make sure file is present.")
end


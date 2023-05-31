#!/usr/bin/env ruby

class Berlin
  include PiPiper

  # create pins, assign values
  def initialize
    @gpio_out = Pin.new(:pin => 2, :direction => :out) # output
    @gpio_in = Pin.new(:pin => 4, :direction => :in) # read source one
    @gpio_in_off = Pin.new(:pin => 17, :direction => :in) # read source two, might not be neccesary
  end # init

  # just make sure this is working
  def test
    puts "=> test successful!"
  end # test

  # Turn stuff off, if neccesary
  def shutdown
    puts "=> powering off"
    puts "==> WARNING: this funktion has not yet been completed!"
    @gpio_out.off
  end # shutdown

  # Turn `berlin' on/off
  def lights(set)

    if set == true
      @gpio_out.on
    else if set == false
      @gpio_out.off
    else
      puts "=> ERROR: wrong input for `lights(mode)'"
    end # if

  end # lights

  def button

    after @gpio_in, :goes => :high do
      puts "=> Button activated, set to high"
      lights(true)
    end # do, after

    after @gpio_in, :goes => :low do
      puts "=> Button deactivated, set to low"
      lights(false)
    end # do, after

    after @gpio_in_off, :goes => :high do
      puts "=> Button deactivated, set to low"
      lights(false)
    end # do, after

  end # button

end # Berlin

    end

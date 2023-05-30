#!/usr/bin/env ruby

class Berlin
  include PiPiper

  def initialize
    @gpio_out = Pin.new(:pin => 2, :direction => :out)
    @gpio_in = Pin.new(:pin => 4, :direction => :in)
    @gpio_in_off = Pin.new(:pin => 17, :direction => :in)
  end

  def gui_test
    puts "=> GUI test successful!"
  end

  def shutdown
    puts "=> powering off"
    puts "==> WARNING: this funktion has not yet been created!"
  end

  def lights(set)

    if set == true
      @gpio_out.on
    else if set == false
      @gpio_out.off
    else
      puts "=> ERROR: wrong input for `river_lights'"
    end

  end

  def button

    after @gpio_in, :goes => :high do
      puts "=> Button activated, set to high"
      lights(true)
    end

    # after @gpio_in, :goes => :low do
    #   puts "=> Button deactivated, set to low"
    #   lights(false)
    # end

    after @gpio_in_off, :goes => :high do
      puts "=> Button deactivated, set to low"
      lights(false)
    end
  end
end


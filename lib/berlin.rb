require './lib/berlin/active.rb'

module Berlin
  class Test
    def initialize
      pastel = Pastel.new
      spinners = TTY::Spinner::Multi.new("TESTING     [:spinner]")
      sp1 = spinners.register "Libraries [:spinner]"
      sp2 = spinners.register "Modules   [:spinner]"
      sp3 = spinners.register "Classes   [:spinner]"
      sp4 = spinners.register "Methods   [:spinner]"
      sp5 = spinners.register "Output    [:spinner]"
      sp1.auto_spin
      sleep(1)
      sp1.success
      sp2.auto_spin
      sleep(1)
      sp2.success
      sp3.auto_spin
      sleep(1)
      sp3.success
      sp4.auto_spin
      sleep(1)
      sp4.success
      sp5.auto_spin
      sleep(1)
      sp5.success
      puts "SUCCESS! Testing finished.\n\n"
    end
  end
end


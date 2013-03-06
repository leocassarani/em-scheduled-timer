require "em-scheduled-timer/version"

module EventMachine
  class ScheduledTimer
    def initialize(time, callback = nil, &block)
      EventMachine.add_timer(time - Time.now, callback || block)
    end
  end
end

require "eventmachine"
require "em-scheduled-timer/version"

module EventMachine
  class ScheduledTimer
    def initialize(time, callback = nil, &block)
      @signature = EventMachine.add_timer(delay(time), callback || block)
    end

    def cancel
      EventMachine.cancel_timer(@signature)
    end

    private

    def delay(time)
      time - Time.now
    end
  end
end

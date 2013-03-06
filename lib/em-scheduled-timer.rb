require "eventmachine"
require "em-scheduled-timer/version"

module EventMachine
  class ScheduledTimer
    def initialize(time, callback = nil, &block)
      @signature = EventMachine.add_timer(interval(time), callback || block)
    end

    def cancel
      EventMachine.cancel_timer(@signature)
    end

    private

    def interval(time)
      time.to_time - Time.now
    end
  end

  def self.add_scheduled_timer(*args, &block)
    interval = args.shift
    callback = args.shift || block
    EventMachine::ScheduledTimer.new(interval, callback)
  end
end

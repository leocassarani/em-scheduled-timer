require 'em-scheduled-timer'

describe EM::ScheduledTimer do
  let(:soon) { Time.now + 0.1 }

  it "runs the block at the given time" do
    EM.run {
      EventMachine::ScheduledTimer.new(soon) do
        EM.stop # Pass
      end

      EM.add_timer(0.2) do
        fail "Expected timer to fire at the scheduled time, but it didn't"
      end
    }
  end

  it "can be cancelled" do
    EM.run {
      timer = EventMachine::ScheduledTimer.new(soon) do
        fail "Expected timer not to fire, but it did"
      end

      timer.cancel

      EM.add_timer(0.2) do
        EM.stop # Pass
      end
    }
  end
end

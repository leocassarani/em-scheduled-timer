require 'eventmachine'
require 'em-scheduled-timer'

describe EM::ScheduledTimer do
  let(:delay) { 12.34 }
  let(:callback) { mock(:callback) }

  it "fires a timer after a delay given by the difference between current and given time" do
    EM.run {
      EventMachine.should_receive(:add_timer) { |actual, _| actual.should be_within(0.1).of(delay) }
      EventMachine::ScheduledTimer.new(Time.now + delay, callback)
      EM.stop
    }
  end

  describe "cancelling a timer" do
    let(:signature) { mock(:signature) }
    before { EventMachine.stub(:add_timer) { signature } }

    it "can be cancelled" do
      EM.run {
        EventMachine.should_receive(:cancel_timer).with(signature)
        timer = EventMachine::ScheduledTimer.new(Time.now + delay, callback)
        timer.cancel

        EM.stop
      }
    end
  end
end

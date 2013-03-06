require 'em-scheduled-timer'
require 'time'
require File.expand_path('../support/eventmachine_helper', __FILE__)

describe EM::ScheduledTimer do
  include EventMachineHelper

  let(:soon) { Time.now + 0.1 }

  describe "instantiating new ScheduledTimers directly" do
    it "runs a block at the given time" do
      EM.run {
        EventMachine::ScheduledTimer.new(soon) { pass }
        fail_after(0.2)
      }
    end

    it "can be given a callable object instead of a block" do
      EM.run {
        callback = lambda { pass }
        EventMachine::ScheduledTimer.new(soon, callback)
        fail_after(0.2)
      }
    end

    it "can be cancelled" do
      EM.run {
        timer = EventMachine::ScheduledTimer.new(soon) do
          fail "Expected timer not to fire, but it did"
        end

        timer.cancel

        pass_after(0.2)
      }
    end
  end

  describe "using the EM.add_scheduled_timer convenience method" do
    it "runs a block at the given time" do
      EM.run {
        EM.add_scheduled_timer(soon) { pass }
        fail_after(0.2)
      }
    end

    it "can be given a callable object instead of a block" do
      EM.run {
        callback = lambda { pass }
        EM.add_scheduled_timer(soon, callback)
        fail_after(0.2)
      }
    end
  end

  describe "specifying a firing time" do
    it "supports DateTime objects" do
      EM.run {
        datetime = soon.to_datetime
        EventMachine::ScheduledTimer.new(datetime) { pass }
        fail_after(0.2)
      }
    end

    it "supports any object that responds to #to_time" do
      EM.run {
        future = mock(:future, to_time: soon)
        EventMachine::ScheduledTimer.new(future) { pass }
        fail_after(0.2)
      }
    end
  end
end

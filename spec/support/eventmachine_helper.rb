module EventMachineHelper
  def fail_after(interval)
    EM.add_timer(interval) do
      fail "Expected timer to fire at the scheduled time, but it didn't"
    end
  end

  def pass
    EM.stop
  end

  def pass_after(interval)
    EM.add_timer(interval) { pass }
  end
end

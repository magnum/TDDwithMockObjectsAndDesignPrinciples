require "minitest/autorun"
require_relative './alarm'

class AlarmTest < Minitest::Test

  
  def create_alarm_set_pressure_and_check(pressure)
    alarm = Alarm.new(FakeSensor.new(pressure))
    alarm.check
    alarm
  end

  def test_pressure_in_range
    alarm = create_alarm_set_pressure_and_check(20)
    assert_equal alarm.alarm_on, false
  end

  def test_under_pressure
    alarm = create_alarm_set_pressure_and_check(10)
    assert_equal alarm.alarm_on, true
  end

  def test_high_pressure
    alarm = create_alarm_set_pressure_and_check(30)
    assert_equal alarm.alarm_on, true
  end

end

class FakeSensor 


  def initialize(pressure)
    @pressure = pressure
  end

  def pop_next_pressure_psi_value
    @pressure
  end


end
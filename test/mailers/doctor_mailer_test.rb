require 'test_helper'

class DoctorMailerTest < ActionMailer::TestCase
  test "appointment_status" do
    mail = DoctorMailer.appointment_status
    assert_equal "Appointment status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "consultation_details" do
    mail = DoctorMailer.consultation_details
    assert_equal "Consultation details", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

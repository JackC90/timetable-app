require 'test_helper'

class TimetableSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable_subject = timetable_subjects(:one)
  end

  test "should get index" do
    get timetable_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_timetable_subject_url
    assert_response :success
  end

  test "should create timetable_subject" do
    assert_difference('TimetableSubject.count') do
      post timetable_subjects_url, params: { timetable_subject: { subject_id: @timetable_subject.subject_id, time_table_id: @timetable_subject.time_table_id } }
    end

    assert_redirected_to timetable_subject_url(TimetableSubject.last)
  end

  test "should show timetable_subject" do
    get timetable_subject_url(@timetable_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetable_subject_url(@timetable_subject)
    assert_response :success
  end

  test "should update timetable_subject" do
    patch timetable_subject_url(@timetable_subject), params: { timetable_subject: { subject_id: @timetable_subject.subject_id, time_table_id: @timetable_subject.time_table_id } }
    assert_redirected_to timetable_subject_url(@timetable_subject)
  end

  test "should destroy timetable_subject" do
    assert_difference('TimetableSubject.count', -1) do
      delete timetable_subject_url(@timetable_subject)
    end

    assert_redirected_to timetable_subjects_url
  end
end

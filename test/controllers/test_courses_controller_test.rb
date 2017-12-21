require 'test_helper'

class TestCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_course = test_courses(:one)
  end

  test "should get index" do
    get test_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_test_course_url
    assert_response :success
  end

  test "should create test_course" do
    assert_difference('TestCourse.count') do
      post test_courses_url, params: { test_course: {  } }
    end

    assert_redirected_to test_course_url(TestCourse.last)
  end

  test "should show test_course" do
    get test_course_url(@test_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_course_url(@test_course)
    assert_response :success
  end

  test "should update test_course" do
    patch test_course_url(@test_course), params: { test_course: {  } }
    assert_redirected_to test_course_url(@test_course)
  end

  test "should destroy test_course" do
    assert_difference('TestCourse.count', -1) do
      delete test_course_url(@test_course)
    end

    assert_redirected_to test_courses_url
  end
end

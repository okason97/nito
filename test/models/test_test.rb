require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save with no title' do
    test = Test.create(date: Time.zone.today, min_score: 5, max_score: 10)
    assert_not test.save
  end

  test 'should not save with no date' do
    test = Test.create(title: 'title',  min_score: 5, max_score: 10)
    assert_not test.save
  end

  test 'should not save with no max score' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5)
    assert_not test.save
  end

  test 'should not save if max_score < min_score' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 2)
    assert_not test.save
  end
end

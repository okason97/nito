class Test < ApplicationRecord
    has_one :score
    has_one :test_course

    def pass
        Score.where(['test_id = ? and value >= ?', id, min_score]).count
    end
    def fail
        Score.where(['test_id = ? and value < ?', id, min_score]).count
    end
    def absent
        Score.where(['test_id = ? and value = -2', id]).count
    end
    def percentage
        (pass/Score.where(test: self).count.to_f*100).to_s + '%'
    end
end
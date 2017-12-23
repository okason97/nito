class Test < ApplicationRecord
    has_one :score, dependent: :destroy
    has_one :test_course, dependent: :destroy

    validates :title, :date, :min_score, :max_score, presence: true
    validates_numericality_of :min_score
    validates_numericality_of :max_score, :greater_than => :min_score

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
        total = Score.where(test: self).count
        if total == 0
            '0%'
        else
            (pass/total.to_f*100).to_s + '%'            
        end
    end
end
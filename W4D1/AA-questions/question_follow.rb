require_relative 'questions_database'
require_relative 'question'
require_relative 'user'

class QuestionFollow
    def self.followers_for_question_id(question_id)
        found_users = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
            SELECT
                *
            FROM
                users
            JOIN
                question_follows ON question_follows.user_id = users.id
            WHERE
                question_follows.question_id = :question_id
        SQL

        found_users.map {|found_user| User.new(found_user)}
    end

    def self.followed_questions_for_user_id(user_id)
        found_questions = QuestionsDatabase.execute(<<-SQL, user_id: user_id)
            SELECT
                *
            FROM
                questions
            JOIN
                question_follows ON question_follows.question_id = questions.id
            WHERE
                question_follows.user_id = :user_id
        SQL

        found_questions.map {|found_question| Question.new(found_question)}
    end

    def self.most_followed_questions(n)
        found_questions = QuestionsDatabase.execute(<<-SQL, n: n)
            SELECT
                *
            FROM
                questions
            JOIN 
                question_follows ON question_follows.question_id = questions.id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(*) DESC
            LIMIT :n
        SQL
    end
end
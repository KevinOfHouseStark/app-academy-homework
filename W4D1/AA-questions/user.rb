require_relative 'question'
require_relative 'questions_database'
require_relative 'question_like'
require_relative 'question_follow'
require_relative 'reply'

class User 

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end 

    def self.find_by_id(id)
        found_user = QuestionsDatabase.get_first_row(<<-SQL, id: id)
            SELECT
                *
            FROM
                users
            WHERE
                users.id = :id
        SQL

        User.new(found_user)
    end

    def self.find_by_name(fname, lname) 
        found_user = QuestionsDatabase.get_first_row(<<-SQL, {fname: fname, lname: lname})
            SELECT
                *
            FROM
                users
            WHERE
                users.fname = :fname AND users.lname = :lname
        SQL

        User.new(found_user)
    end 

    attr_accessor :id, :fname, :lname 
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 

    def authored_questions 
        Question.find_by_author_id(id)
    end 

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(id)
    end
end 
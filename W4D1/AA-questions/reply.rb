require_relative 'question'
require_relative 'questions_database'
require_relative 'user'

class Reply

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end 

    def self.find_by_id(id)
        found_reply = QuestionsDatabase.get_first_row(<<-SQL, id: id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.id = :id
        SQL

        Reply.new(found_reply)
    end

    def self.find_by_parent_id(parent_id)
        found_replies = QuestionsDatabase.execute(<<-SQL, parent_reply_id: parent_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.parent_reply_id = :parent_reply_id
        SQL

        found_replies.map {|found_reply| Reply.new(found_reply)}
    end

    def self.find_by_user_id(user_id) 
        found_replies = QuestionsDatabase.execute(<<-SQL, user_id: user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.author_id = :user_id
        SQL

        found_replies.map {|found_reply| Reply.new(found_reply)}
    end 

    def self.find_by_question_id(question_id)
        found_replies = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.question_id = :question_id
        SQL

        found_replies.map {|found_reply| Reply.new(found_reply)}
    end 

    attr_accessor :id, :question_id, :parent_reply_id, :author_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end 

    def author
        User.find_by_id(author_id)
    end 

    def question 
        Question.find_by_id(question_id)
    end 

    def parent_reply
        Reply.find_by_id(id)
    end 

    def child_replies
        Reply.find_by_parent_id(id)
    end 
end
require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question_like'
require_relative 'question_follow'
require 'byebug'

class Question

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end 

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.find_by_id(id)
        # debugger;
        found_question = QuestionsDatabase.get_first_row(<<-SQL, id: id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = :id
        SQL

        Question.new(found_question)
    end 

    def self.find_by_author_id(author_id)
        found_questions = QuestionsDatabase.execute(<<-SQL, author_id: author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = :author_id
        SQL

        found_questions.map {|found_question| Question.new(found_question)}
    end 

    attr_accessor :id, :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 

    def author 
        User.find_by_id(author_id)
    end 

    def replies 
        Reply.find_by_question_id(id)
    end  

    def followers
        QuestionFollow.followers_for_question_id(id)
    end
end 

require 'erb'

class ShowExceptions
  attr_reader :app
  
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      app.call(env)
    rescue => exception
      render_exception(exception)
    end
  end

  private

  def render_exception(e)
    path = File.dirname(__FILE__)
    template = File.join(path, "templates", "rescue.html.erb")
    template_file = File.read(template)
    content = ERB.new(template_file).result(binding)

    ['500', {"Content-type"=>"text/html"}, 'RuntimeError', content]
  end
end

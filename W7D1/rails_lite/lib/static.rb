class Static
  MIME_TYPES = {'.txt'=>'text/plain', '.jpg'=>'image/jpeg', '.zip'=>'application/zip'}
  
  attr_reader :app
  def initialize(app)
    @app = app
    @root = :public
  end

  def call(env)
    req = Rack::Request.new(env)
    path = req.path
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, '..', path)
    res = Rack::Response.new

    if File.exist?(file_name)
      res["Content-type"] = MIME_TYPES[File.extname(file_name)]
      res.write(File.read(file_name))
    else
      res.status = 404
      res.write('No such file')
    end

    res
  end
end

require 'json'

class Flash
  attr_reader :now
  def initialize(req)
    cookie = req.cookies['_rails_lite_app_flash']

    if cookie
      @now = JSON.parse(cookie)
    else
      @now = {}
    end
    @flash = {}
  end

  def []=(key, val)
    @flash[key.to_s] = val
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', value: @flash.to_json, path: '/')
  end

  def [](key)
    if @now[key.to_s]
      @now[key.to_s]
    else
      @flash[key.to_s]
    end
  end
end

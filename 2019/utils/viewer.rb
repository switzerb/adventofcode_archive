require 'httparty'
require 'net/http'
require 'uri'

class Viewer
  include HTTParty

  RED = "1,0,0" 
  ORANGE = "1,.50,0"
  YELLOW = "1,1,0"

  def initialize
    @frames = Array.new
    set_frame
  end

  def set_frame
   # add hash to @frames
   @frames.push({e: [ { r: [100,200,300,400] } ]})
   @frames.push({e: [{c: { n: "color", v: RED }},{r: [150,250,350,450]}]})
  end

  def visualize
    data = {
      b: {e: [{r: [50,50,500,55] }] },
      f: @frames
    }

    options = {
      headers: {
        "Content-Type": "application/json"
      },
      body: data.to_json
    }
    response = HTTParty.post('http://localhost:8080/scene', options)
    response
  end

end


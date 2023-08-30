class Device
  attr_reader :recordings
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      recording = yield 
      record(recording)
    else
      return nil
    end
  end

  def play
    puts recordings[-1]
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
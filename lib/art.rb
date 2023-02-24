require "singleton"

class Art
  include Singleton

  def method_missing(name, *args)
    File.open(__dir__ + "/art/#{name}.txt").read()
  end
end

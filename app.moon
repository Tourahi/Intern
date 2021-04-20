lapis = require "lapis"

class extends lapis.Application
  "/": =>
    "Learning #{require "lapis.version"}!"

module Baidu
  module Rank
  end
  module SEM
  end
end

class String
  def snake_case
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end
class Savon
  class Response
    def header
      hash[:envelope][:header]
    end
    def res_header
      header[:res_header]
    end
    def desc
      res_header[:desc]
    end
    def quota
      res_header[:quota]
    end
    def rquota
      res_header[:rquota]
    end
    def oprs
      res_header[:oprs]
    end
    def oprtime
      res_header[:oprtime]
    end
    def failures
      res_header[:failures]
    end
    def code
      failures[:code] if failures
    end
    def message
      failures[:message] if failures
    end
    def status
      res_header[:status]
    end
  end
end
require "baidu/version"
require "baidu/map"
require "baidu/translate"
require "baidu/sem"
require "baidu/rank"
require "baidu/auth"
require "baidu/response"
require "ext"
require "awesome_print"
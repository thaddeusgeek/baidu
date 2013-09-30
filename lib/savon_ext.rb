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
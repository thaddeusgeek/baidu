module Baidu
  class Response
    attr_accessor :header,:body,:rquota,:quota,:status,:desc,:oprs,:oprtime
    def initialize(response,name_response_sym)
      @header = response.header[:res_header]
      @body = response.body[name_response_sym] if(response.body and response.body.has_key?name_response_sym)
      @rquota = @header[:rquota].to_i
      @quota = @header[:quota].to_i
      @status = @header[:status].to_i
      @desc = @header[:desc]
      @oprs = @header[:oprs]
      @oprtime = @header[:oprtime]
    end
  end
end
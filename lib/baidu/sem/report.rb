module Baidu
  module SEM
    class ReportService < Base
      def getProfessionalReportId(options)
        necessary_options = [:performanceData, :startDate, :endDate, :statIds]
        raise "necessary options:#{necessary_options}" if invalid_options?(options,necessary_options)
        operation = make_operation('getProfessionalReportId')
        operation.header = operation_header
        operation.body = {
          :getProfessionalReportIdRequest=>{
            :reportRequestType => options
          }
        }
        if @debug
          puts operation.build
        end
        response = operation.call
        if @debug
          p response.hash
        end
        response = response.body[:get_professional_report_id_response]
        return false if response.nil? or response[:report_id].nil?
        response[:report_id].to_s
      end

      def getRealTimeData
        operation = make_operation('getRealTimeData')
      end

      def getReportState(report_id)
        raise "your input report_id:#{report_id} is invalid" unless report_id =~ /[a-z0-9]{32}/
        operation = make_operation('getReportState')
        operation.header = operation_header
        operation.body = {
          :getReportStateRequest => {
            :reportId => report_id
          }
        }
        if @debug
          puts operation.build
        end
        response = operation.call
        if @debug
          p response.hash
        end
        response = response.body
        return false if response.nil? or response[:get_report_state_response].nil? or response[:get_report_state_response][:is_generated].nil?
        response[:get_report_state_response][:is_generated]
      end

      def getReportFileUrl(report_id)
        raise "report_id invalid" unless report_id =~ /[a-z0-9]{32}/
        operation = make_operation('getReportFileUrl')
        operation.header = operation_header
        operation.body = {
          :getReportFileUrlRequest=>{
            :reportId=>report_id
          }
        }

        if @debug
          puts operation.build
        end

        response = operation.call

        if @debug
          p response.hash
        end

        response = response.body[:get_report_file_url_response]
        return false if response.nil? or response[:report_file_path].nil?
        response[:report_file_path]
      end
      def getRealTimeQueryData(options)
        abort 'not ready'
        necessary_options = [:performanceData, :startDate, :endDate, :statIds]
        raise "necessary options:#{necessary_options}" if invalid_options?(options,necessary_options)
        operation = make_operation('getRealTimeQueryData')
        operation.header = operation_header
        operation.body = {
          :getRealTimeQueryDataRequest=>{
            :realTimeQueryRequestTypes => options
          }
        }
        if @debug
          puts operation.build
        end
        response = operation.call
        if @debug
          p response.hash
        end
        # response.body[:get_professional_report_id_response]

      end
      def getRealTimePairData(options)
        operation = make_operation("getRealTimePairData")
        operation.header = operation_header
        operation.body = {
          :getRealTimePairDataRequest =>{
            :realTimePairRequestTypes =>options
          }
        }
      end
    end
  end
end
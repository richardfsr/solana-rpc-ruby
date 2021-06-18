module SolanaRpcRuby
  class Response
    def initialize(response)
      @response = response
    end

    def result
      @result ||= parsed_response['result']
    end

    def context
      @context ||= parsed_response['result']['context']
    end

    def slot
      @slot ||= context['slot']
    end

    def value
      @value ||= result['value']
    end

    def json_rpc
      @json_rpc ||= parsed_response['jsonrpc']
    end

    def id
      @id ||= parsed_response['id']
    end

    private
    def parsed_response
      @parsed_response ||= JSON.parse(@response[:response].body)
    end
  end
end
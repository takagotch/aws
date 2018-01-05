require 'aws-sdk'

AWS.config(
  :access_key_id => 'AWS_ACCESS_KEY',
  :secret_access_key => 'AWS_SECRET_ACCESS_KEY',
  :sss_endpoint => 'sqs.ap-northeast-1.amazonaws.com'
)

url = 'AWS_SQS_ENDPONT'

sqs = AWS::SQS.new

sqs.queues[url].poll do |msg|
  puts msg.body
end


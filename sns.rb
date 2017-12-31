require 'aws-sdk'

AWS.config({
  :access_key_id     => 'AWS_ACCESS_KEY',
  :secret_access_key => 'AWS_SECRET_ACCESS_KEY',
})

topic = AWS::SNS::Topic.new(
  'arn:aws:sns:us-east-1:YOUR_ACCEOUNT_ID:TOPIC_ARN')
topic.publish('Notification from SNS')


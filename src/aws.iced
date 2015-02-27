conf = require('./config')
aws_conf = conf.AWS

aws = {}

aws.ec2 = require('aws-sdk').ec2({
  accessKeyId: aws_conf.ACCESS_KEY,
  secretAccessKey: aws_conf.SECRET_KEY,
  sslEnabled: true,


})

aws.create_instances = (InstanceType, KeyName, PrivateIpAddress, SubnetId) ->
  params =
    ImageId: aws_conf.IMAGEID
    MaxCount: 1
    MinCount: 1
    # ClientToken - TODO: make idempotent - see http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html
    # IamInstanceProfile - TODO
    InstanceType: InstanceType or aws_conf.INSTANCETYPE
    KeyName: KeyName or aws_conf.KEYNAME
    SubnetId: SubnetId or aws_conf.SUBNETID

module.exports = aws

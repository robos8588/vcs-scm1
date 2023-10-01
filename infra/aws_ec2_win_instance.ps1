# Set your AWS region and other parameters
$region = "us-east-1"  # Change to your desired region
$amiId = "ami-12345678"  # Replace with the desired Amazon Machine Image (AMI) ID
$instanceType = "t2.micro"  # Replace with the desired instance type
$keyName = "your-key-name"  # Replace with your EC2 key pair name
$securityGroupIds = "sg-12345678"  # Replace with your security group ID

# Launch the EC2 instance
$instance = New-EC2Instance -ImageId $amiId -InstanceType $instanceType -KeyName $keyName -SecurityGroupId $securityGroupIds -Region $region

# Retrieve the instance ID and public IP address
$instanceId = $instance.Instances[0].InstanceId
$publicIpAddress = $instance.Instances[0].PublicIpAddress

Write-Host "EC2 instance with ID $instanceId has been created."
Write-Host "Public IP address of the instance: $publicIpAddress"

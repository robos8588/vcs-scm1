#!/bin/bash

# Set your AWS region and other parameters
region="us-east-1"  # Change to your desired region
ami_id="ami-12345678"  # Replace with the desired Amazon Machine Image (AMI) ID
instance_type="t2.micro"  # Replace with the desired instance type
key_name="your-key-name"  # Replace with your EC2 key pair name
security_group_ids="sg-12345678"  # Replace with your security group ID

# Launch the EC2 instance
instance_id=$(aws ec2 run-instances \
  --region "$region" \
  --image-id "$ami_id" \
  --instance-type "$instance_type" \
  --key-name "$key_name" \
  --security-group-ids "$security_group_ids" \
  --query "Instances[0].InstanceId" \
  --output text)

echo "EC2 instance with ID $instance_id has been created."

# Optionally, wait for the instance to be running
aws ec2 wait instance-running --instance-ids "$instance_id"

# Optionally, retrieve the public IP address of the instance
public_ip=$(aws ec2 describe-instances \
  --instance-ids "$instance_id" \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "Public IP address of the instance: $public_ip"

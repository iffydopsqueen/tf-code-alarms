provider "aws" {
    region = "us-east-2"
}

resource "aws_cloudwatch_log_group" "yada" {
    name = "Yada"

    tags = {
        Environment = "prod"
    }
}

resource "aws_instance" "web" {
    ami = "ami-00dfe2c7ce89a450b" 
    instance_type = "t2.micro"

    tags = {
        Name = "tf-example"
    }
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
    alarm_name = "terraform-test-alerts"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "1"
    metric_name = "CPUUtilization"  # u don't have to have dashboard before creating an alarm 
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "20"
    alarm_description = "This metric monitors EC2 CPU Utilization"
    alarm_actions = [aws_sns_topic.alarm-topic.arn]
    dimensions = {
        InstanceId = aws_instance.web.id
    }
}

resource "aws_sns_topic" "alarm-topic" {
    name = "Alert-Notifications"
    display_name = "Alert notifications"
}

resource "aws_sns_topic_subscription" "alarm-topic-subscription" {
    topic_arn = aws_sns_topic.alarm-topic.arn
    protocol = "email"
    endpoint = var.sns_email_endpoint
}

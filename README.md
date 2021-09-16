# tf-code-alarms

The alarm feature in AWS CloudWatch allows you to watch CloudWatch metrics and to receive notifications when the metrics fall outside of the levels (high or low thresholds) that you configure. 

A CloudWatch Alarm is always in one of three states: OK, ALARM, or INSUFFICIENT_DATA. When the metric is within the range that you have defined as acceptable, the Monitor is in the OK state. When it breaches a threshold it transitions to the ALARM state. If the data needed to make the decision is missing or incomplete, the monitor transitions to the INSUFFICIENT_DATA state.

Alarms watch metrics and execute actions by publishing notifications to Amazon SNS topics. SNS (Simple Notification Service) can deliver notifications using HTTP, HTTPS, Email, or an Amazon SQS queue. Your application can receive these notifications and then act on them in any desired way.

Actions can be set for the transition into each of the three states. The behavior of these actions depends on the type of action that you have associated with the alarm, and will not be re-executed if the condition persists for hours or days. 

When creating an alarm, the following properties can be specified:

- `threshold`: The value to compare the metric value against.
- `comparisonOperator`: The type of comparison that should be made between the metric value and the threshold value. Legal values include `GreaterThanOrEqualToThreshold`, `GreaterThanThreshold`, `LessThanThreshold`, and `LessThanOrEqualToThreshold`. 
- `evaluationPeriods`: The number of periods over which data is compared to the specified threshold.

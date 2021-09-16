# tf-code-alarms

The alarm feature in AWS CloudWatch allows you to watch CloudWatch metrics and to receive notifications when the metrics fall outside of the levels (high or low thresholds) that you configure. 

A CloudWatch Alarm is always in one of three states: `OK`, `ALARM`, or `INSUFFICIENT_DATA`. When the metric is within the range that you have defined as acceptable, the Monitor is in the `OK` state. When it breaches a threshold it transitions to the `ALARM` state. If the data needed to make the decision is missing or incomplete, the monitor transitions to the `INSUFFICIENT_DATA` state.

Alarms watch metrics and execute actions by publishing notifications to Amazon SNS topics. SNS (Simple Notification Service) can deliver notifications using application, lambda, email, email-json, http, https, sms or amazon sqs. Your application can receive these notifications and then act on them in any desired way.

Actions can be set for the transition into each of the three states. The behavior of these actions depends on the type of action that you have associated with the alarm, and will not be re-executed if the condition persists for hours or days. 

When creating an alarm, the following properties can be specified:

- `threshold`: The value to compare the metric value against.
- `comparisonOperator`: The type of comparison that should be made between the metric value and the threshold value. Legal values include `GreaterThanOrEqualToThreshold`, `GreaterThanThreshold`, `LessThanThreshold`, and `LessThanOrEqualToThreshold`. 
- `evaluationPeriods`: The number of periods over which data is compared to the specified threshold.

### How Are AWS CloudWatch Alarms Evaluated?

**Evaluation Periods and DatapointsToAlarm**

There are three settings that control when an alarm goes off:

- **Period** is the length of time over which the underlying metric is evaluated. The alarm period does not need to match the underlying metric period, but it needs to be at least as long as the metric period. CloudWatch will essentially generate one alarm data point per alarm period, based on the value(s) of the underlying metric during that period.
- **Evaluation period** is the number of alarm periods (or alarm data points) to take into account when determining whether the alarm is triggered or not.
- **DatapointsToAlarm** is the number of alarm data points that must breach the threshold during the evaluation period for the alarm to go off.

For example, let’s assume that the alarm period is the same as the underlying metric period, the evaluation period is 3, and the DatapointsToAlarm is 2. For any 3 consecutive alarm data points, the alarm will go into the ALARM state if at least 2 out of 3 data points breach the alarm threshold. If for a given set of 3 consecutive alarm data points, only one or less breach the threshold, the alarm will not be in the ALARM state.

resource "aws_iam_instance_profile" "demo_consumer" {
  name  = "consumer_profile"
  roles = ["${var.instance_role}"]
  #TODO use role for more recent version of terraform
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.instance_role}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "test-attach" {
    role       = "${aws_iam_role.ec2_role.id}"
    policy_arn = "${aws_iam_policy.ec2_policy.arn}"
}

resource "aws_iam_policy" "ec2_policy" {
  name = "ec2_role_policy"
  description = "EC2 Role "

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
                  "logs:CreateLogGroup",
                  "logs:CreateLogStream",
                  "logs:PutLogEvents",
                  "logs:DescribeLogStreams"
              ],
              "Effect": "Allow",
              "Resource": [
                  "arn:aws:logs:*:*:*"
              ]
          }

,
          {
           "Action": [
                  "sqs:*"
                 ],
          "Effect": "Allow",
          "Resource": "*"
        },
        {
        "Effect": "Allow",
        "Action": [
           "s3:Get*",
          "s3:List*"
        ],
      "Resource": "*"
       }
  ]
}
EOF
}

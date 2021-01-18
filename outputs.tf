output "user_arn" {
 value = "${aws_iam_role.s3_access_role.*.arn}"
}

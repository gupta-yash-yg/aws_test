
resource "aws_iam_user" "s3_user_1" {
   name = "internal_user"
}

resource "aws_iam_role" "s3_access_role" { 
   name = "s3-role-1" 
   assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "s3policy1" {
  name        = "s3-policy-1"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "s3-policy-attachment"
  users      = [aws_iam_user.s3_user_1.name]
  roles      = [aws_iam_role.s3_access_role.name]
  policy_arn = aws_iam_policy.s3policy1.arn
}

resource "aws_iam_user" "s3_user_2" {
  name = "external_user"
}


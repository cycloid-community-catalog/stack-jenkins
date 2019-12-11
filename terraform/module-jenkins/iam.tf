data "aws_iam_policy_document" "assume-role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# create IAM role for jenkins 
resource "aws_iam_role" "jenkins" {
  name               = "engine-cycloid-${var.project}-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume-role.json
  path               = "/${var.project}/"
}

# create instance profile
resource "aws_iam_instance_profile" "jenkins" {
  name = "engine-cycloid-jenkins-${var.project}-${var.env}"
  role = aws_iam_role.jenkins.name
}


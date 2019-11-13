resource "aws_eks_cluster" "eks_cluster" {
    name     = var.cluster_name
    version  = var.cluster_version
    role_arn = aws_iam_role.role.arn

    vpc_config {
        subnet_ids = var.subnet_ids
    }
}

resource "aws_iam_role" "role" {
    assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
    version = "2012-10-17"
    statement {
        effect  = "Allow"
        principals {
            type        = "Service"
            identifiers = ["eks.amazonaws.com"]
        }
        actions = ["sts:AssumeRole"]
    }
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

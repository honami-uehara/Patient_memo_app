resource "aws_iam_user" "github_actions" {
  name = "github-actions-for-patient-memo-app"
}

resource "aws_iam_policy" "deploy" {
      name        = "deploy"
      path        = "/"
      description = "deploy policy"
      policy      = file("aws_iam_policies/image_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "deploy-attach" {
      user       = aws_iam_user.github_actions.name
      policy_arn = aws_iam_policy.deploy.arn
}

# Creating Role with name testrole
module "test_iam_role" {
  source = ""
  rolename = "testrole"
  envname = "${}"
  instanceprofilename = ""
}
module "test_iam_policy" {
  source = ""
  attachroles = "${}"
  policyname = ""
}


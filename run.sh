if [ $# != 2 ]
then
  echo 'Insufficient arguments:'
  echo './run.sh <command> <workspace>'
  exit 1
fi
TF_COMMAND=$1
TF_ENV=$2
terraform workspace select ${TF_ENV} && terraform ${TF_COMMAND} -var aws_profile=${TF_ENV} -var-file=workspace-variables/${TF_ENV}.tfvars

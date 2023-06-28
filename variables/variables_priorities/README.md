PROOF 1 : to check the priporty of command_line_flag which is 1

run the following commands

1. export TF_VAR_instancetype="t2.nano"
2. terraform plan -var="instancetype=t2.small"

u can see that 
instance_type                        = "t2.small"

even if files like terraform.tfvars and variables.tf is present and env_var=TF_VAR_instancetype is present the priority goes to command_line_flag which which is -var="instancetype=t2.small"

PROOF 2: to check the priporty of tfvars file which is 2

run the following commands

1. export TF_VAR_instancetype="t2.nano"
2. terraform plan 

u can see that 
instance_type                        = "t2.medium"

even if files like variables.tf is present and has default value as t2.micro and env_var=TF_VAR_instancetype is present the priority goes to .tfvars files which is instancetype="t2.medium" in file terraform.tfvars

PROOF 3: to check the priority of Environment variable which is 3

create enviroment variable which starts with "TF_VAR_" and add the variable string to it

export TF_VAR_{variable_name} = {variable_value}

example: 
1. export TF_VAR_instancetype="t2.nano"
2. comment out the terraform.tfvars
3. terraform plan 

u can see that 
instance_type                        = "t2.nano"

even if files like variables.tf is present and has default value as t2.micro 

PROOF 4: to check the priority of variable defaults from variables.tf which is 4

example: 
1. unset TF_VAR_instancetype
2. comment out the terraform.tfvars
3. terraform plan 

u can see that 
instance_type                        = "t2.micro"

since the only way to fetch the variable is from varaibles.tf so the default variable is fetched
the last preority

so the priority for fetching variables goes like this



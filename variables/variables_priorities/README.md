# Variable Priority in Terraform

This README file explains the priority order of variables in Terraform, based on various sources. The following proofs demonstrate how variables are prioritized in different scenarios.

## Proof 1: Command Line Flag (Priority 1)

To check the priority of the command line flag, perform the following steps:

1. Set the environment variable `TF_VAR_instancetype` to "t2.nano".
   ```
   export TF_VAR_instancetype="t2.nano"
   ```

2. Run the command:
   ```
   terraform plan -var="instancetype=t2.small"
   ```

   The output will show that `instance_type` is set to "t2.small". This indicates that the command line flag `-var` takes priority over other sources.

## Proof 2: tfvars File (Priority 2)

To check the priority of the tfvars file, follow these steps:

1. Set the environment variable `TF_VAR_instancetype` to "t2.nano".
   ```
   export TF_VAR_instancetype="t2.nano"
   ```

2. Run the command:
   ```
   terraform plan
   ```

   The output will show that `instance_type` is set to "t2.medium". This indicates that the `.tfvars` file (`terraform.tfvars` in this case) takes priority over other sources.

## Proof 3: Environment Variable (Priority 3)

To check the priority of environment variables, follow these steps:

1. Create an environment variable starting with "TF_VAR_" and add the variable string to it. For example:
   ```
   export TF_VAR_instancetype="t2.nano"
   ```

2. Comment out the `terraform.tfvars` file.

3. Run the command:
   ```
   terraform plan
   ```

   The output will show that `instance_type` is set to "t2.nano". This demonstrates that environment variables prefixed with "TF_VAR_" take priority over other sources.

## Proof 4: Variable Defaults from variables.tf (Priority 4)

To check the priority of variable defaults from the `variables.tf` file, follow these steps:

1. Unset the environment variable `TF_VAR_instancetype`.
   ```
   unset TF_VAR_instancetype
   ```

2. Comment out the `terraform.tfvars` file.

3. Run the command:
   ```
   terraform plan
   ```

   The output will show that `instance_type` is set to "t2.micro". This indicates that when no other sources are available, the default value defined in the `variables.tf` file is used as a fallback.

In summary, the priority for fetching variables in Terraform follows the order:

1. Command line flag (`-var` option)
2. tfvars file (e.g., `terraform.tfvars`)
3. Environment variables (prefixed with "TF_VAR_")
4. Variable defaults from `variables.tf`

Make sure to consider this priority order when setting and managing variables in your Terraform projects.
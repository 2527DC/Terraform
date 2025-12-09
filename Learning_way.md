Providers
Resources
Variables
Output
States -> This is the MOST important Terraform concept

            What is terraform.tfstate?

            Remote state (S3 + DynamoDB lock, Azure Blob, GCP bucket)

            State locking

            Sensitive values in state

            State drift detection

            terraform state commands

            When to NOT edit state manually

## Lifecycle

        create_before_destroy

        prevent_destroy

        ignore_changes

## 1Q -> Why u should have .tfvars in root level only

The automatic loading mechanism for files named terraform.tfvars, terraform.tfvars.json,or \*.auto.tfvars only
works for the root module (the directory from which you run the terraform plan or terraform apply command).

## Store Terraform output into a file

### Method 1

when we run terrafrom apply and we need to read the output but not in terminal instead we can use any json or txt file t get append the data what we get in jsonn by terrafrom -json > outpit.json

### METHOD 2 Use Terraform local_file resource (store output when you run apply)

BENEFIT -> 1 Output gets written automatically
2 Format is clean JSON
3 You can use it for scripting, automation, logging ( BUT HOW )

### METHOD 3 — Use the -state file

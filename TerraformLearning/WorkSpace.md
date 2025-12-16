# Terraform Workspaces for Multi-Environment Management

## What is the use of a workspace in Terraform?

Terraform **workspaces** are used to manage **multiple environments (dev, test, staging, production, etc.) using a single Terraform codebase** while keeping their **state files isolated**.

---

## The common problem in real projects

In a real-world Terraform project, infrastructure is usually written in a **modular way** so that:

- Every developer does **not** need to create a separate Terraform project
- The same modules can be reused across environments

A common approach is to create variable files like:

- `dev.tfvars`
- `test.tfvars`
- `prod.tfvars`

At first glance, it looks like we can simply change the variable file and run Terraform for different environments.

---

## The twist: Terraform state file

Terraform maintains a **state file** that tracks:

- What resources exist
- Their current configuration
- Any changes made during `terraform apply`

If you:

1. Apply infrastructure using `dev.tfvars`
2. Then switch to `test.tfvars` and run Terraform again

Terraform will **modify or overwrite the same resources**, because it is still using **one single state file**.

This creates a problem:

- You cannot preserve dev, test, and production infrastructures separately
- Switching environments will always change the existing infrastructure

---

## Why copying the Terraform project is not a good solution

One option is to maintain **separate copies of the same Terraform project** for each environment.

However, this leads to:

- Code duplication
- Difficult maintenance
- Higher risk of configuration drift

---

## How Terraform workspaces solve this problem

Terraform workspaces allow you to:

- Use **one single Terraform project**
- Maintain **separate state files for each environment**
- Reuse the same modules and code

Each workspace has its **own isolated state file**, even though the Terraform configuration is the same.

---

## Using tfvars with workspaces

You can combine **workspaces** with **environment-specific tfvars files**:

- `dev.tfvars` → `dev` workspace
- `test.tfvars` → `test` workspace
- `prod.tfvars` → `prod` workspace

Example flow:

```bash
terraform workspace new dev
terraform apply -var-file=dev.tfvars

terraform workspace new test
terraform apply -var-file=test.tfvars

terraform workspace new prod
terraform apply -var-file=prod.tfvars
```

Each workspace:

- Uses the same Terraform code
- Uses its own variable values
- Maintains a **separate state file**

---

## Final summary

Terraform workspaces are useful because they:

- Enable **environment isolation** without duplicating code
- Keep **state files separate** for dev, test, staging, and production
- Allow teams to manage multiple infrastructures from **one Terraform project**
- Work seamlessly with `*.tfvars` files for environment-specific configuration

This approach makes Terraform projects **cleaner, safer, and easier to manage** across multiple stages.

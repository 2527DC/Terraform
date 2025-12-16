# 🚀 Mastering Terraform Variables — A Must-Know for Every DevOps Engineer

Terraform variables play a **major role** in creating reusable and scalable infrastructure. Instead of writing different code for each environment, we can simply pass values dynamically using variables — keeping our project clean and consistent.

---

## 🔧 Why Variables Matter

In Terraform, we usually declare variables inside a file like `variables.tf` where we define:

- variable name
- type
- description
- default value

This allows us to use **one project** for different environments (dev, test, prod) without touching the main code.

---

## 📁 Using `.tfvars` Files

Terraform allows us to override default values using `.tfvars` files such as:

- `dev.tfvars`
- `prod.tfvars`
- `staging.tfvars`

This helps us maintain a single codebase while customizing values for each environment.

---

## 📦 Important Note When Using Modules

A very common mistake:

> **Variables declared inside a module are only available inside that module, not in the root module.**

So when you declare variables inside `modules/vpc/variables.tf`, Terraform will NOT automatically apply values from the root `.tfvars`.

### ✔ Correct Approach

- Declare variables inside the module
- Declare the same variables in the root module
- Pass the values from root → module

Example:

```hcl
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.cidr_block
}
```

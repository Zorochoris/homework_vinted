# Vinted SRE GCP homework

Vinted SRE homework on Google Cloud Platform with Terraform and Ansible.

## Task

Write a Terraform code that:
  * Creates a VPC with a primary subnet;
  * Creates a Compute instance with a public IP;
  * Runs an Ansible playbook to install and configure Atlantis server;
  * Configures the network firewall so only SSH and Atlantis ports are allowed on the instance.

The code should be reusable, have a clear structure, and naming convention. Bonus points if you can define everything with a Terraform wrapper like 
Terragrunt and write an integration test with Terratest.

The end result should be a live and accessible Atlantis instance running on a public IP address.

## Development setup

Prerequisites:

* Install [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform);
* Install [Google Cloud CLI](https://cloud.google.com/sdk/docs/install).

## Authentication

1. Go to the Google Cloud Platform project: https://console.cloud.google.com/welcome?project=my-project-id

2. Verify that you have access to the *Compute Engine* and *VPC Network* services by simply navigating in the UI;

3. Use `gcloud` CLI to obtain local credentials for your user account using a web-based authorization flow:
   ```
   gcloud auth login
   ```

4. Verify that you have access to the project:
   ```
   gcloud projects list
   PROJECT_ID           NAME                 PROJECT_NUMBER
   my-project-id        my-project-name      123456789123
   ```

5. Define a Google Cloud Provider in your Terraform code to start working:

   ```
   provider "google" {
     project = "my-project-id"
     region  = "europe-west-1"
   }
   ```

## Resources

Software

* [Terraform](https://terraform.io/)
* [Terragrunt](https://terragrunt.gruntwork.io/)
* [Terratest](https://terratest.gruntwork.io/)
* [Atlantis](https://runatlantis.io/)

References

* [Google Cloud](https://cloud.google.com/)
* [Google Cloud Console](https://console.cloud.google.com/)
* [Terraform intro](https://developer.hashicorp.com/terraform/intro)
* [Terraform GCP provider](https://registry.terraform.io/providers/hashicorp/google/latest/)
* [Terraform GCP provider docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
* [Markdown](https://guides.github.com/features/mastering-markdown/)

---

## Important

Vinted, UAB collects, uses and stores your provided information to assess your suitability to enter into employment contract and suggest a job offer for you (we have the intention to enter into a contract with you (Art. 6 (1) (b) of GDPR). For more information on how Vinted, UAB uses your data and your rights, please see Vinted Job Applicant Privacy Policy available here: <https://www.vinted.com/jobs/policy>

By submitting the response to the given task, you hereby consent that Vinted, UAB shall have the right to reproduce and use the response that you submit for the purpose of its recruitment processes, which will be anonymised after your recruitment process.
# homework_vinted

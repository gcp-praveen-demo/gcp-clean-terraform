terraform {
  backend "gcs" {
    bucket  = "devops-terraform-state-bucket-12345"  # Replace with your bucket name
    prefix  = "terraform/state"             # Folder path inside the bucket
  }
}

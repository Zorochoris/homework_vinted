terraform {
  source = "git::github.com/Zorochoris/homework_vinted"
}

inputs = {
  project_id  = "central-insight-387811"
  region      = "us-central1"
  subnet_cidr = "10.0.1.0/24"
}

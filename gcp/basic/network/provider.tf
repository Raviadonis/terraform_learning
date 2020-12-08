## Configure the Google Cloud Provider
provider "google" {
  credentials   = file("gcp-key.json")
  project       = playground-s-11-5fadf64c
  region        = asia-south1
  }

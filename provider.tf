terraform {
  required_providers {
    wasabi = {
      source  = "thesisedu/wasabi"
      version = "4.1.9"
    }
    random = {
      source = "hashicorp/random"
    }    
  }
}

provider "wasabi" {
  access_key = var.wasabi_access_key
  secret_key = var.wasabi_secret_key
  region     = var.wasabi_region
}
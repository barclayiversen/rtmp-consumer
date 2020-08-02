data "terraform_remote_state" "foundation" {
    backend = "gcs"
    
    config = {
        bucket = "mixfreely"
        prefix = "foundation/"
    }
}

data "terraform_remote_state" "appip" {
     backend = "gcs"
    
    config = {
        bucket = "mixfreely"
        prefix = "appip/"
    }
}

terraform {
    required_version = "0.12.29"

    backend "gcs" {
        bucket = "mixfreely"
        prefix = "goserver/"
    }
}

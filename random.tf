resource "random_pet" "deepika_pet" {
    length = 2
}

resource "random_password" "deepika_password" {
    length  = 15
    special = true
}

resource "random_id" "deepika_id" {
    byte_length = 8
}

resource "random_integer" "deepika_integer" {
    min = 10
    max = 100
}

resource "random_string" "deepika_string" {
    length  = 12
    upper = true
    special = true
}

resource "random_uuid" "deepika_uuid" {

}

resource "random_shuffle" "random_region" {
    input        = ["us-east-1", "us-east-2"]
    result_count = 1
}

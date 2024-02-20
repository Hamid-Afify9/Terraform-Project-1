provider "aws" {

    region= "us-east-1"
    access_key= "AKIAT3SITV6F423YUQGS"
    secret_key= "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"

}

resource "aws_vpc" "my_vpc" {

    cidr_block= "10.10.0.0/16"
    #enable_dns_hostnames= true
    tags ={
        Name: "my_vpc"
    }
}




data "aws_vpc" "remote_vpc" {

    default= true
}


resource "aws_subnet" "my_subnet2" {

    vpc_id = data.aws_vpc.remote_vpc.id
    cidr_block= "172.31.180.0/24"
    availability_zone= "us-east-1a"
    tags= {
        Name= "my_subnet2"
        Key= "value"
    }

}


provider "aws" {

 region = "us-east-1"
}
# Crawler resource policies:

# Crawler IAM role
resource "aws_iam_role" "crawler_iam_role" {
    name = "sw_dl_crawler"
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": [
        "glue.amazonaws.com",
        "s3.amazonaws.com"]},
    "Action": "sts:AssumeRole"
  }
}
POLICY
}

resource "aws_iam_role_policy_attachment" "crawler_attach" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
    role = "${aws_iam_role.crawler_iam_role.name}"
}



# Glue Database
resource "aws_glue_catalog_database" "catalog_database" {
    name = "${var.glue_db_name}"
}

# Crawler
resource "aws_glue_crawler" "datalake_crawler" {
    database_name = "${var.glue_db_name}"
    name          = "${var.crawler_name}"
    role          = "${aws_iam_role.crawler_iam_role.name}"
    description   = "${var.crawler_description}"
    table_prefix  = "${var.table_prefix}"
    schedule      = "${var.schedule}"

    s3_target {
      path = "s3://athenademo12/"
}
}

resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "your_table_name"
  database_name = "${var.glue_db_name}"
  table_type    = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL = "TRUE"
  }

  storage_descriptor {
    location      = "s3://athenademo12/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.mapred.TextInputFormat"

    ser_de_info {
      name                  = "my-serde"
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"

      parameters = {
        "field.delim"            = ","
        "skip.header.line.count" = "1"
      }
    }

    columns {
      name = "column1"
      type = "string"
    }

    columns {
      name = "column2"
      type = "string"
    }

  }
}

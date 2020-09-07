# Variables
# DB
 variable "glue_db_name" {
     description = "Name the Glue Database"
     default = "demo"
 }
# Crawler
variable "crawler_name" {
      default = "demo1"
}

variable "crawler_description" {
  description = "Crawler Description"
  default = "demo2"
}

variable "table_prefix" {
  description = "Table Prefix"
  default = "demo3"
}

variable "schedule" {
  description = "Schedule, a cron expresion in form of cron(15 12 * * ? *) "
  default = "cron(15 12 * * ? *)"
}

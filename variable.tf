# Variables
# DB
 variable "glue_db_name" {
     description = "Name the Glue Database"
    type = "string"
 }
# Crawler
variable "crawler_name" {
      type = "string"
}

variable "crawler_description" {
  description = "Crawler Description"
  type = "string"
}

variable "table_prefix" {
  description = "Table Prefix"
  type = "string"
}

variable "schedule" {
  description = "Schedule, a cron expresion in form of cron(15 12 * * ? *) "
  type = "string"
}

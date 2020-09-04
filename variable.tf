# Variables
# DB
 variable "glue_db_name" {
     description = "Name the Glue Database"
    type = "string"
 }
# Crawler
variable "crawler_name" {
    default = "sw_dl_crawler"
}

variable "crawler_description" {
  description = "Crawler Description"
  default = "Managed by this guy"
}

variable "table_prefix" {
  description = "Table Prefix"
  type = "string"
}

variable "schedule" {
  description = "Schedule, a cron expresion in form of cron(15 12 * * ? *) "
  default = "cron(0 * * * ? *)"
}

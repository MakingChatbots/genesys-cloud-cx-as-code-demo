variable "environment" {
  type        = string
  description = "Environment name, used in resource names"
}

variable "book_purchase_queue_name" {
  type = string
  description = "Name of queue for book purchases"
}

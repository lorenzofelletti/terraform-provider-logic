variable "optional_var_a" {
  description = "Optional variable A. If set, also optional_var_b must be set."
  type        = string
  default     = null
}

variable "optional_var_b" {
  description = "Optional variable B. If set, also optional_var_a must be set."
  type        = string
  default     = null

  validation {
    condition     = provider::logic::xnor(var.optional_var_a != null, var.optional_var_b != null)
    error_message = "You must set one and only one of `optional_var_a` or `optional_var_b`."
  }
}

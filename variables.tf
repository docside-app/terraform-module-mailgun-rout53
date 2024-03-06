variable "mailgun_subdomain" {
    type = string
    description = "FQDN for mailgun-specific domains."
}

variable "zone_id" {
    type = string
    description = "The Route53 zone ID for the root domain."
}

variable "dkim_selector" {
    type = string
    description = "The mailgun DKIM selector"
}

variable "dkim_key" {
    type = string
    description = "The 1024-bit RSA public key for Mailgun DKIM"
}

variable "mx_records" {
    type = list
    description = "Mailgun's MX records. Can be optionally set."
    default = [ "10 mxa.mailgun.org", "10 mxb.mailgun.org" ]
}
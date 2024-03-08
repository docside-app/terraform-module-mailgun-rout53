# terraform-module-mailgun-route53
A module which will create the necessary Route53 records for mailgun domain validation and use.

# Requirements
AWS Provider configured in your root TF / OpenTofu module.

# Usage
```hcl
module "mailgun" {
  source = "github.com/docside-app/terraform-module-mailgun-route53?ref=v0.1.0"

  mailgun_subdomain = "example.com"
  zone_id = "YOURROUTE53ZONEID"
  dkim_selector = "smtp" # mailgun defaults to "smtp"
  dkim_key = "k=rsa; p=YOURKEYHERE" # Use a 1024-bit key with Route53
}
```

The MX records default to:
- `"10 mxa.mailgun.org"`
- `"10 mxb.mailgun.org"`

The can be overriden with the following input value:
`mx_records = [ List of Strings ]`
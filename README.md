### A Ruby wrapper for the Persist IQ API

Based on the Taylor Brooks Ruby Close.io API Wrapper: https://github.com/taylorbrooks/closeio

## Usage
```ruby
require 'persistiq'

client = Persistiq::Client.new('Your secret key')
```


## Users
Returns all users on a given account
```ruby
client.list_users
```

## Leads
List all, view, and create leads
```ruby
#list leads
client.list_leads

#create a lead or leads, options include dup: specify 'skip' or 'update'
client.create_lead(
    dup: "update",
    creator_id: "u_pnYGL3",
    leads: [
      {
        first_name: "Buster",
        last_name: "Bluth",
        email: "buster@bluthco.com",
        company_name: "The Bluth Company"
      },
      {
        first_name: "Lucille",
        last_name: "Bluth",
        name: "Lucille Bluth",
        email: "lucille@bluthco.com",
        company_name: "The Bluth Company"
      }
    ]
  )
#view a single lead
client.get_lead("l_3knw5N")

```


## Campaigns
List, and add leads to a campaign
```ruby
#list all campaigns
client.list_campaigns

#add leads to a campaign
client.add_leads_to_campaign(
  id: campaign_id,
  leads: [
    {id: lead_id},
    {id: lead_id}
  ]
)
```


### Copyright
Copyright (c) 2015 Jamie Quint. See LICENSE for details.

#Mixpanel to Vero

A simple Ruby program that fetches data from Mixpanel (via [Data Export API](https://mixpanel.com/docs/api-documentation/data-export-api)) and compiles a CSV file that Vero will understand. Parameters passed to this program will be passed to the Mixpanel API.

This program currently supports CSV generation of passed events.

## Usage

```
git clone https://github.com/jylamont/mixpanel_to_vero
cd mixpanel_to_vero
ruby app.rb api_key=abcd api_secret=1234 from_date=2012-10-05 to_date=2012-10-11
```

- `api_key` - your Mixpanel API key (found here: [https://mixpanel.com/account/](https://mixpanel.com/account/))
- `api_secret` - your Mixpanel API secret (found here: [https://mixpanel.com/account/](https://mixpanel.com/account/))
- `from_date` - date in yyyy-mm-dd format from which to begin querying for the event from
- `to_date` - date in yyyy-mm-dd format from which to begin querying for the event to

For more information, [click here](https://mixpanel.com/docs/api-documentation/exporting-raw-data-you-inserted-into-mixpanel).
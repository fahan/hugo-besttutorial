# Google AdSense Setup Guide

## Overview
Your Hugo site is now configured with Google AdSense integration. The setup includes:
- AdSense script in the `<head>` section
- In-article ad placement after post content
- Flexible configuration via `config.yaml`

## Files Created

### 1. [layouts/partials/extend_head.html](file:///c:/Users/hanss/Documents/BT/hugo-besttutorial/layouts/partials/extend_head.html)
Loads the Google AdSense script and enables Auto Ads if configured.

### 2. [layouts/partials/adsense-in-article.html](file:///c:/Users/hanss/Documents/BT/hugo-besttutorial/layouts/partials/adsense-in-article.html)
Displays in-article ads with fluid layout.

### 3. [layouts/_default/single.html](file:///c:/Users/hanss/Documents/BT/hugo-besttutorial/layouts/_default/single.html)
Override of the PaperMod theme's single post template to include ad placement after content.

## Configuration

Your [config.yaml](file:///c:/Users/hanss/Documents/BT/hugo-besttutorial/config.yaml) now includes AdSense settings:

```yaml
googleAdsense:
  enabled: false  # Set to true when ready
  publisherId: "ca-pub-XXXXXXXXXXXXXXXX"  # Your Publisher ID
  autoAds: true  # Google Auto Ads
  inArticleAd: true  # In-article ads
  adSlots:
    inArticle: "XXXXXXXXXX"  # Your ad slot ID
```

## Next Steps

### 1. Get Your AdSense Account
- Sign up at https://www.google.com/adsense
- Add your site: https://besttutorial.net
- Wait for approval (can take 1-2 weeks)

### 2. Get Your Publisher ID
- Go to AdSense dashboard → Account → Account Information
- Copy your Publisher ID (format: `ca-pub-XXXXXXXXXXXXXXXX`)
- Replace in `config.yaml`

### 3. Create Ad Units (Optional for Auto Ads)
If using manual in-article ads:
- Go to Ads → By ad unit → In-article ads
- Create a new ad unit
- Copy the ad slot ID
- Replace `XXXXXXXXXX` in `config.yaml`

### 4. Enable AdSense
In `config.yaml`, change:
```yaml
enabled: false
```
to:
```yaml
enabled: true
```

### 5. Deploy
Deploy your site to production. AdSense will not work on localhost.

## Ad Placement Options

### Auto Ads (Recommended for Beginners)
- Set `autoAds: true`
- Google automatically places ads
- No additional configuration needed
- Easiest to set up

### Manual In-Article Ads
- Set `inArticleAd: true`
- Ads appear after post content
- More control over placement
- Requires ad slot ID

### Both
You can enable both Auto Ads and manual placement for maximum coverage.

## Testing

After deployment:
1. Visit your site in an incognito window
2. Check browser console for errors
3. Ads may take 24-48 hours to appear initially
4. Check AdSense dashboard for impressions

## Important Notes

> [!WARNING]
> - Ads will **not** display on localhost
> - Initial ad serving may take 24-48 hours
> - Ensure your site complies with [AdSense Program Policies](https://support.google.com/adsense/answer/48182)

> [!TIP]
> Start with Auto Ads enabled. Once you see how Google places ads, you can disable Auto Ads and use manual placements for more control.

## Customization

### Add More Ad Placements
You can add ads in other locations by:
1. Creating new partials (e.g., `adsense-sidebar.html`)
2. Including them in templates where needed
3. Adding corresponding ad slot IDs to `config.yaml`

### Disable Ads on Specific Posts
Add to post front matter:
```yaml
---
title: "My Post"
googleAdsense:
  enabled: false
---
```

Then update `adsense-in-article.html` to check for page-level override.

## Troubleshooting

### Ads Not Showing
- Verify `enabled: true` in config
- Check Publisher ID is correct
- Wait 24-48 hours after first deployment
- Check AdSense account is approved
- View in incognito mode (ad blockers may hide ads)

### Console Errors
- Verify ad slot IDs are correct
- Ensure site is added to AdSense account
- Check for HTTPS (AdSense requires secure sites)

## Support

For AdSense-specific issues, visit:
- [AdSense Help Center](https://support.google.com/adsense)
- [AdSense Community](https://support.google.com/adsense/community)

# AdSense Script Not Appearing - Debugging Guide

## Current Configuration Status

✅ **Config is correct:**
- `enabled: true`
- `publisherId: "ca-pub-3171822523723030"`
- `autoAds: true`
- `inArticleAd: true`

✅ **Files created:**
- `layouts/partials/extend_head.html`
- `layouts/partials/adsense-in-article.html`
- `layouts/_default/single.html`

## Why the Script Might Not Appear

### 1. **Hugo Environment Check**

The theme's `head.html` (line 200) only includes certain partials in production mode:

```go
{{- if hugo.IsProduction | or (eq site.Params.env "production") }}
```

However, `extend_head.html` is called on line 197, BEFORE this check, so it should work.

**Your config has:** `env: production` ✅

### 2. **Build the Site First**

If you're checking on `hugo server`, you need to rebuild:

```bash
# Stop the server (Ctrl+C)
hugo server --buildDrafts
```

Then visit: `http://localhost:1313/any-post/`

### 3. **Check the HTML Source**

**Steps:**
1. Visit any post page (not the homepage)
2. Right-click → View Page Source
3. Press `Ctrl+F` and search for: `pub-3171822523723030`

**What you should see in the `<head>` section:**
```html
<!-- Google AdSense -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3171822523723030" crossorigin="anonymous"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

### 4. **Possible Issues**

#### Issue A: Checking Homepage Instead of Post Page
The AdSense script should appear on ALL pages, but the in-article ad only appears on post pages.

**Solution:** Make sure you're viewing a post page like:
- `http://localhost:1313/apa-itu-cinta/`
- NOT just `http://localhost:1313/`

#### Issue B: Browser Cache
Your browser might be showing cached HTML.

**Solution:**
- Hard refresh: `Ctrl+Shift+R` or `Ctrl+F5`
- Or use Incognito mode

#### Issue C: Template Override Issue
If you have other template files that might be overriding the head.

**Solution:** Check if you have these files (you shouldn't):
- `layouts/partials/head.html` (delete if exists)
- `layouts/_default/baseof.html` (check if it exists)

## Quick Test

Run this command to build and check:

```bash
# Build the site
hugo --cleanDestinationDir

# Check if the script is in a built file (PowerShell)
Select-String -Path "public\apa-itu-cinta\index.html" -Pattern "pub-3171822523723030"
```

If this returns results, the script IS being included in the build.

## Manual Verification Steps

### Step 1: Verify extend_head.html is being called

Add a test comment to `layouts/partials/extend_head.html` at the very top:

```html
<!-- ADSENSE TEST: extend_head.html is loaded -->
{{- if .Site.Params.googleAdsense.enabled -}}
...
```

Rebuild and check if you see this comment in the page source.

### Step 2: Check if the condition is working

Temporarily remove the condition to test:

```html
<!-- ADSENSE TEST: extend_head.html is loaded -->
<!-- Google AdSense -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3171822523723030" crossorigin="anonymous"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

If the script appears now, the issue is with the `{{- if .Site.Params.googleAdsense.enabled -}}` condition.

## Most Likely Solution

Based on your setup, the most likely issue is:

**You're checking the wrong page or the browser cache.**

Try this:
1. Stop Hugo server (Ctrl+C)
2. Run: `hugo server --disableFastRender`
3. Visit a POST page (not homepage): `http://localhost:1313/apa-itu-cinta/`
4. Hard refresh: `Ctrl+Shift+R`
5. View source and search for your Publisher ID

## Need More Help?

If still not working, check:
1. Are you viewing the source of a POST page?
2. Did you rebuild after making changes?
3. Is there a `layouts/partials/head.html` file? (there shouldn't be)

Let me know what you find!

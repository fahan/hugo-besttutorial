# Quick AdSense Verification Steps

## Step 1: Rebuild Your Site

```bash
# Stop any running Hugo server (Ctrl+C)
hugo server --disableFastRender
```

## Step 2: Visit a POST Page

Open your browser and go to:
- `http://localhost:1313/apa-itu-cinta/`
- Or any other post URL (NOT the homepage)

## Step 3: View Page Source

- Right-click → **View Page Source** (or press `Ctrl+U`)
- Press `Ctrl+F` to search

## Step 4: Search for These Strings

Search for each of these in order:

### 1. Search for: `AdSense Partial Loaded`
- ✅ **Found** = The extend_head.html partial is working
- ❌ **Not found** = The partial isn't being loaded (file issue)

### 2. Search for: `pub-3171822523723030`
- ✅ **Found** = AdSense script is included! 🎉
- ❌ **Not found** = The condition `googleAdsense.enabled` might be false

### 3. Search for: `adsbygoogle`
- ✅ **Found** = AdSense code is present
- ❌ **Not found** = Script not loading

## Expected Output in Page Source

You should see this in the `<head>` section:

```html
<!-- AdSense Partial Loaded -->
<!-- Google AdSense -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3171822523723030" crossorigin="anonymous"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

## If You Don't See It

1. **Hard refresh the page:** `Ctrl+Shift+R` or `Ctrl+F5`
2. **Check you're on a POST page, not homepage**
3. **Restart Hugo server:**
   ```bash
   # Press Ctrl+C to stop
   hugo server
   ```

## On Your Live Site

After deploying to https://besttutorial.net:

1. Visit any post page
2. View source
3. Search for `pub-3171822523723030`
4. It should be there!

**Note:** Ads won't actually display on localhost, but the script should be in the HTML source.

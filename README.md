[![Netlify Status](https://api.netlify.com/api/v1/badges/4f3c0f38-44a1-45ff-8344-c3ac1a5d252c/deploy-status)](https://app.netlify.com/sites/bickers-personal-site/deploys)

# My Website

This is my website, containing my resume and book reviews.
The site is made with plain HTML, CSS and JS, statically generated with Hugo, and hosted on Netlify.

Visit at [bickers.dev](https://bickers.dev).

## Build

Build with

```console
> ./build.sh
```

The build script requires a standard Chrome installation on Mac and will download and locally store a Chrome binary on Ubuntu.
Other operating systems are not currently supported.

## Resume PDF generation

The creation of a PDF resume is handled in [`build.sh`](https://github.com/mbickers/personal-site/blob/main/build.sh).
These are the steps in the process:
1. Hugo generates `public/resume/index.html`. Resources like CSS are directly included rather than linked to.
1. Chrome is run in headless mode, which renders and "prints" the file as a PDF.
1. `public/resume/index.html` is removed.

I tried using other tools such as [wkhtmltopdf](https://wkhtmltopdf.org) and [weasyprint](https://weasyprint.org), but they didn't like my CSS.

## License

MIT



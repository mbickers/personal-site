[![Netlify Status](https://api.netlify.com/api/v1/badges/4f3c0f38-44a1-45ff-8344-c3ac1a5d252c/deploy-status)](https://app.netlify.com/sites/heuristic-torvalds-da597f/deploys)

# My personal site

My website, containing my resume and book reviews.
Front-end made with plain HTML, CSS and JS.
The site is statically generated with Hugo and hosted on Netlify.

Visit at [bickers.dev](https://bickers.dev). 

## Build

Build with

```console
> ./build.sh
```

The build script requires a standard Chrome installation on Mac and will download and locally store a Chrome binary on Ubuntu.
Other operating systems are not currently supported.

## Resume PDF generation

The creation of a PDF resume that stays consistent is handled in [`build.sh`](https://github.com/mbickers/personal-site/blob/main/build.sh). These are the steps in the process:
1. Hugo generates `public/resume/index.html`. Resources like CSS are directly included rather than linked to
1. Chrome is run in headless mode, which renders and "prints" the file as a PDF
1. `public/resume/index.html` is removed

I tried using other tools such as [wkhtmltopdf](https://wkhtmltpdf.org) and [weasyprint](https://weasyprint.org), but they did not work well.

## License

MIT



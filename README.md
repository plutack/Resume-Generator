# Resume generator
 This is a simple repo that allows easy iteration of resumes leveraging git branches and github actions to generate a pdf and html file leveraging github actions.


**Update:**
- I added a Makefile since I can just install Pandoc and WkHtmltopdf and run locally so github actions file are now commented out.
- Wkhtmltopdf has a bbug where svg sometimes don't render.Using github actions with ubuntu image. The version of wkhtmltopdf installed works well but not on arch my pc distro. I now use get the icons by fetching them via icon8 url thereby the make command now needs active internet to properly create the pdf file. 

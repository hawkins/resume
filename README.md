# Josh Hawkins' Resume

Thanks for checking out my resume.
If you're just here to see the latest version, check out the `Josh_Hawkins_Resume_YYYY-MM-DD.pdf` file above (with the recent date, of course).

## Rationale

My resume is written in LaTeX, compiles to PDF via xelatex, and is given a reasonable name automatically via a simple little bash script.
I previously used ShareLaTeX for this, but eventually wanted to automate updating my resume on my website and portfolio, since it was a tedious task otherwise and easy to forget.
Since ShareLaTeX doesn't have any solution for this, I decided to leverage xelatex myself, write a simple Node.js webapp to find and download the latest resume, and link to the web app's URL on my website and in emails.
This way, the link will always lead to the most recent version of the Resume in the master branch of this repository.

## Map

### `/`

The root folder contains the actual source code for the resume.

`Makefile` is used to compile the resume. It removes old resumes, compiles the new one, and names it properly. Simply run `make` to compile this if you have `xelatex` installed.

`resule.cls` and `resume.tex` are the source files for my resume.

The `.pdf` file is my actual resume. On the master branch, that's the latest public version at all times.

### `/app`

The `/app` folder is home to the Node.js web app used to redirect users to the latest resume's download link upon visiting it. Basically, it...

- Queries GitHub for files at `hawkins/resume`
- Looks for `files` with extension `.pdf` and `resume` (case-insensitive) in the file name
- Redirects users to the download link for the file

So, when a user visits the web app, they'll just simply download my resume (and most browsers would then close the tab, too).
This is super handy, because I can deploy this to a site (say, [`AWS Lambda and API Gateway`](https://1qd9htvyo5.execute-api.us-east-1.amazonaws.com/default/hawkins-resume) and then send this link to recruiters or add it to my website and it will always reference the most recent version of my resume, since I always commit this to the master branch.

### `/fonts`

This folder of course just has the fonts used in my resume (Raleway and Lato)

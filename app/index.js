const http = require("http");
const https = require("https");

// Config
const port = process.env.PORT || 80;
const user = "hawkins";
const repo = "resume";
const path = "";

// Set the response to redirect to the given url
const redirect = (res, url) => {
  res.writeHead(302, { Location: url });
  res.end();
};

// Add a given error to the page
const errorFragment = err =>
  `<html><body><p>An error occurred while fetching the latest resume</p><code>${err}</code></body></html>`;

// Respond with an error
const error = (res, error) => {
  res.writeHead(500, { "content-type": "text/html" });
  res.end(errorFragment(error));
};

// Get all files in root folder of repo
const getFiles = () =>
  new Promise((resolve, reject) => {
    // https://developer.github.com/v3/repos/contents/#get-contents
    https.get(
      {
        hostname: "api.github.com",
        path: `/repos/${user}/${repo}/contents/${path}`,
        headers: {
          "User-Agent": "Hawkins Resume App",
          Accept: "application/vnd.github.v3+json"
        }
      },
      res => {
        res.setEncoding("utf8");
        let body = "";
        res.on("data", data => (body += data));
        res.on("end", () => {
          try {
            resolve(JSON.parse(body));
          } catch (e) {
            reject(e);
          }
        });
      }
    );
  });

// Create the server
// TODO: Make async
const server = http.createServer(async (req, res) => {
  const files = await getFiles();
  files.map(f => (f.type === "file" ? console.log(f.name) : null));
  redirect(res, "https://github.com/hawkins/resume/raw/master/resume.pdf");
});

// Listen for requests
server.listen(port);
console.log(`Now listening on port ${port}`);

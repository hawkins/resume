const http = require("http");

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

// TODO: Get the latest resume link

// Create the server
const server = http.createServer((req, res) => {
  redirect(res, "https://github.com/hawkins/resume/raw/master/resume.pdf");
});

// Listen for requests
const port = process.env.PORT || 80;
server.listen(port);

console.log(`Now listening on port ${port}`);

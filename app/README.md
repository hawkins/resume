# Hawkins Resume App

This is a simple node.js app to redirect users to the latest version of my resume. This way, I can deploy this app and simply link download buttons and recruiters to my app's URL in order to download the latest resume at any time.

## Example

Assume the app is deployed to AWS Lambda with an API Gateway endpoint attached.

A download link could be added to any webpage like so: `<a href="API_GATEWAY_ENDPOINT" target="_blank" rel="noreferrer noopener">Download latest resume</a>`

## Deploying

Create a lambda function and supply the provided `index.js` as the code. Then, add a trigger for a new API Gateway.

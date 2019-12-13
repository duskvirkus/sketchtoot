require('dotenv').config();
const Mastodon = require('mastodon-api');

console.log("sketchtoot starting...");

const sketchtoot = new Mastodon({
  client_key: process.env.CLIENT_KEY,
  client_secret: process.env.CLIENT_SECRET,
  access_token: process.env.ACCESS_TOKEN,
  api_url: process.env.API_DOMAIN,
  timeout_ms: 60 * 1000,
});

toot();

// Functions

function toot() {
  sketchtoot.post('statuses', {
    status: "Hello World!"
  }, (error, data) => {
    if (error) {
      console.error(error);
    } else {
      console.log(`Post ID: ${data.id} timestamp: ${data.created_at} content: ${data.content}`);
    }
  });
}
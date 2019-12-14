require('dotenv').config();
const Mastodon = require('mastodon-api');
const fs = require('fs');
const util = require('util');
const readdir = util.promisify(require('fs').readdir);

const regexPNGFile = new RegExp(/^.*\.png$/);
const regexJSONFile = new RegExp(/^.*\.json$/);

console.log("sketchtoot starting...");

const sketchtoot = new Mastodon({
  client_key: process.env.CLIENT_KEY,
  client_secret: process.env.CLIENT_SECRET,
  access_token: process.env.ACCESS_TOKEN,
  api_url: process.env.API_DOMAIN,
  timeout_ms: 60 * 1000,
});

toots('./topost/').catch(err => console.error(err));

// Functions

async function toots(dirPath) {

  const postData = await processFolderIndividualPosts(dirPath);
  const postDataKeys = Object.keys(postData);

  for (let i = 0; i < postDataKeys.length; ++i) {
    const uploadResponse = await sketchtoot.post('media', {
      file: postData[postDataKeys[i]]['stream'],
      description: postData[postDataKeys[i]]['meta']['altText'] 
    });
    await sketchtoot.post('statuses', {
      status: postData[postDataKeys[i]]['meta']['sketchName'] ,
      media_ids: [uploadResponse.data.id]
    });
  }
}

async function processFolderIndividualPosts(dirPath) {
  return new Promise(async (resolve, reject) => {
    const files = await readdir(dirPath);
    
    let postData = {};
    files.forEach(file => {
      const split = file.split('.');
      if (split.length !== 2) reject("Too many .s in filename " + file);
      const name = split[0];
      const type = split[1];
  
      if (!postData[name]) {
        postData[name] = {};
      }
  
      if (type === 'png') {
        postData[name]['stream'] = fs.createReadStream(dirPath + file);
      } else if (type === 'json') {
        const rawFile = fs.readFileSync(dirPath + file);
        postData[name]['meta'] = JSON.parse(rawFile);
      } else {
        reject("Unknown file type in " + dirPath + ".");
      }
  
    });

    const keys = Object.keys(postData);
    for (let i = 0; i < keys.length; ++i) {
      if (!postData[keys[i]]['meta']['altText']) reject("Alt text for all images is required. Failed to find any for " + keys[i] + ".");
      if (!postData[keys[i]]['stream']) reject("Unable to find image for " + keys[i] + ".");
    }

    resolve(postData);
  });
}
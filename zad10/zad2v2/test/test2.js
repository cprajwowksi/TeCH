const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:31549';


const client = new MongoClient(uri);

async function main() {
  try {
    await client.connect();
    console.log('Connected to MongoDB server');
    const databasesList = await client.db().admin().listDatabases();
    console.log('Databases:');
    databasesList.databases.forEach(db => {
      console.log(`- ${db.name}`);
    });
  } finally {
    await client.close();
  }
}

main().catch(console.error);

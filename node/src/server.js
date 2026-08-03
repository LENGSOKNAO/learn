import app from "./app.js";
import env from "./config/env.js";
import { ensureUploadDir } from "./utils/upload.js";

const start = async () => {
  await ensureUploadDir();
  app.listen(env.port, () => {
    console.log(`Server is running on port ${env.port}`);
  });
};

start();
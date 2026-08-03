import path from "path";
import { fileURLToPath } from "url";
import env from "./env.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export const uploadConfig = {
  uploadDir: path.resolve("uploads"),
  maxFileSize: env.upload.maxFileSize,
  allowedTypes: env.upload.allowedTypes,
};
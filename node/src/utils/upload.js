import path from "path";
import fs from "fs/promises";
import { uploadConfig } from "../config/upload.js";

export const ensureUploadDir = async () => {
  try {
    await fs.mkdir(uploadConfig.uploadDir, { recursive: true });
  } catch {
    // directory exists
  }
};

export const validateFile = (file) => {
  if (!file) return "No file uploaded";
  if (file.size > uploadConfig.maxFileSize) return "File too large";
  if (!uploadConfig.allowedTypes.includes(file.mimetype)) return "File type not allowed";
  return null;
};
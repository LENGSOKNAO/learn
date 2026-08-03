import { validateFile } from "../utils/upload.js";

export const handleUpload = (req, res, next) => {
  if (!req.file) return next();
  const error = validateFile(req.file);
  if (error) {
    return res.status(400).json({ success: false, message: error });
  }
  next();
};
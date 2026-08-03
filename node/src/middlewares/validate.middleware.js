export const validate = (schema) => (req, res, next) => {
  const { error, value } = schema(req.body);
  if (error) {
    return res.status(400).json({ success: false, message: error });
  }
  req.body = value;
  next();
};
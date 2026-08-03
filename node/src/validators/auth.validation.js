export const loginSchema = (data) => {
  const errors = [];
  if (!data.email) errors.push("Email is required");
  if (!data.password) errors.push("Password is required");
  return { error: errors.length > 0 ? errors.join(", ") : null, value: data };
};

export const registerSchema = (data) => {
  const errors = [];
  if (!data.email) errors.push("Email is required");
  if (!data.password || data.password.length < 6) errors.push("Password must be at least 6 characters");
  if (!data.username) errors.push("Username is required");
  return { error: errors.length > 0 ? errors.join(", ") : null, value: data };
};

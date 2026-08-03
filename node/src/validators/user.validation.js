export const updateUserSchema = (data) => {
  const errors = [];
  const allowed = ["first_name", "last_name", "username", "phone", "address", "city", "state", "country", "postal_code", "bio", "profile_image"];
  const keys = Object.keys(data);
  const invalid = keys.filter((k) => !allowed.includes(k));
  if (invalid.length > 0) errors.push(`Invalid fields: ${invalid.join(", ")}`);
  return { error: errors.length > 0 ? errors.join(", ") : null, value: data };
};
export const productSchema = (data) => {
  const errors = [];
  if (!data.name) errors.push("Product name is required");
  if (!data.slug) errors.push("Slug is required");
  if (!data.price || isNaN(data.price)) errors.push("Valid price is required");
  return { error: errors.length > 0 ? errors.join(", ") : null, value: data };
};
export const orderSchema = (data) => {
  const errors = [];
  if (!data.shipping_address_id) errors.push("Shipping address is required");
  return { error: errors.length > 0 ? errors.join(", ") : null, value: data };
};